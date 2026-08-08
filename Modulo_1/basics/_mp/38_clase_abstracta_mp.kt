abstract class DispositivoBase(val nombre: String) {
    // abstract — las subclases DEBEN implementar esto (herencia forzada)
    abstract val precio: Double
    abstract val almacenamiento: Int
    abstract fun descripcion(): String

    // concreto — disponible en todas las subclases (reutilización)
    fun comparar(otro: DispositivoBase): String =
            when {
                precio > otro.precio -> "$nombre es más caro que ${otro.nombre}"
                precio < otro.precio -> "$nombre es más barato que ${otro.nombre}"
                else -> "$nombre y ${otro.nombre} tienen el mismo precio"
            }

    // Polimorfismo: toString usa precio y descripcion que son polimórficas
    override fun toString() = "${descripcion()} | Precio: $${"%.2f".format(precio)}"
}

class Smartphone(val marca: String, val ram: Int, override val precio: Double) : DispositivoBase("Smartphone $marca") {
    override val almacenamiento: Int = 128
    override fun descripcion() = "Smartphone $marca con ${ram}GB RAM"
}

class Tablet(val marca: String, val pantallaPulgadas: Double, override val precio: Double) : DispositivoBase("Tablet $marca") {
    override val almacenamiento: Int = 64
    override fun descripcion() = "Tablet $marca de $pantallaPulgadas pulgadas"
}

class Smartwatch(val marca: String, val bateriaHoras: Int, override val precio: Double) : DispositivoBase("Smartwatch $marca") {
    override val almacenamiento: Int = 32
    override fun descripcion() = "Smartwatch $marca con ${bateriaHoras}h de batería"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier DispositivoBase
    val catalogo: List<DispositivoBase> = listOf(
        Smartphone("Samsung Galaxy S24", 12, 999.99),
        Tablet("iPad Air", 10.9, 749.99),
        Smartwatch("Apple Watch S9", 18, 399.99)
    )

    catalogo.forEach { println(it) } // toString polimórfico

    val masCaros = catalogo.maxByOrNull { it.precio }
    println("\nDispositivo más caro: ${masCaros?.nombre}")

    println(catalogo[0].comparar(catalogo[1]))
}
