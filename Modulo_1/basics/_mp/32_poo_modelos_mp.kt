package modulo1.basics.p32mp

data class Marca(val id: Int, val nombre: String)

data class DispositivoMovil(
        val id: Int,
        val nombre: String,
        val precio: Double,
        val marca: Marca,
        val activo: Boolean = true
)

fun main() {
    val samsung = Marca(1, "Samsung")
    val apple = Marca(2, "Apple")

    val d1 = DispositivoMovil(1, "Galaxy S24", 999.99, samsung)
    val d2 = DispositivoMovil(1, "Galaxy S24", 999.99, samsung)
    val d3 = DispositivoMovil(2, "iPhone 15 Pro", 1299.99, apple)

    // toString() automático
    println(d1) // DispositivoMovil(id=1, nombre=Galaxy S24, ...)

    // equals() por valor
    println(d1 == d2) // true
    println(d1 == d3) // false

    // copy() — nuevo objeto con cambios puntuales
    val oferta = d1.copy(precio = 799.99) // crea una copia de d1 con precio rebajado
    val descontinuado = d1.copy(activo = false) // crea una copia de d1 como inactivo
    println(oferta) // DispositivoMovil(id=1, nombre=Galaxy S24, precio=799.99...)
    println(descontinuado) // DispositivoMovil(id=1, ..., activo=false)

    // Desestructuración
    val (id, nombre, precio) = d1
    println("$id: $nombre — $$precio")

    // En bucles
    listOf(d1, d3).forEach { (id2, nombre2, precio2) -> println("[$id2] $nombre2: $$precio2") }
}
