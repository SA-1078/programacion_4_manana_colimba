package modulo1.basics.p35mp

data class Marca(val id: Int, val nombre: String)

data class DispositivoMovil(
    val id:        Int,
    val nombre:    String,
    val precio:    Double,
    val stock:     Int,
    val marca:     Marca,
    val activo:    Boolean = true
) {
    // ABSTRACCIÓN: el usuario consulta disponible sin saber la lógica
    val disponible: Boolean get() = activo && stock > 0
    val precioConIva: Double get() = precio * 1.19

    // Devuelve una copia — inmutabilidad como forma de encapsulamiento
    fun aplicarDescuento(porcentaje: Double): DispositivoMovil {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

// ENCAPSULAMIENTO: el estado del catálogo es privado y mutable internamente
object CatalogoMoviles {
    private val marcas = mutableListOf(
        Marca(1, "Samsung"),
        Marca(2, "Apple"),
        Marca(3, "Xiaomi")
    )
    private val dispositivos = mutableListOf<DispositivoMovil>()
    private var siguienteId = 1

    fun agregarDispositivo(nombre: String, precio: Double, stock: Int, marcaId: Int): DispositivoMovil? {
        val marca = marcas.find { it.id == marcaId } ?: return null
        val dispositivo = DispositivoMovil(siguienteId++, nombre, precio, stock, marca)
        dispositivos.add(dispositivo)
        return dispositivo
    }

    // ABSTRACCIÓN: interfaz pública limpia — solo lectura de listas
    fun listar(): List<DispositivoMovil>              = dispositivos.toList()
    fun disponibles(): List<DispositivoMovil>         = dispositivos.filter { it.disponible }
    fun porMarca(id: Int): List<DispositivoMovil>     = dispositivos.filter { it.marca.id == id }
    fun buscar(query: String): List<DispositivoMovil> =
        dispositivos.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoMoviles.agregarDispositivo("Galaxy S24",    999.99, 15, 1)
    CatalogoMoviles.agregarDispositivo("Galaxy A55",    399.99,  0, 1)
    CatalogoMoviles.agregarDispositivo("iPhone 15 Pro", 1299.99, 5, 2)
    CatalogoMoviles.agregarDispositivo("Xiaomi 14",     699.99,  8, 3)

    println("=== Todos los dispositivos ===")
    CatalogoMoviles.listar().forEach { d ->
        val estado = if (d.disponible) "✅" else "❌"
        println("$estado ${d.nombre} — ${"%.2f".format(d.precioConIva)} (con IVA)")
    }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoMoviles.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.nombre}: ${"%.2f".format(it.precio)}") }

    for (dispositivo in CatalogoMoviles.listar()) {
        println("${dispositivo.nombre} - ${dispositivo.precioConIva}")
    }
}
