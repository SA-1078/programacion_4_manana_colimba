package modulo1.basics.p32

data class Producto(
        val id: Int,
        val nombre: String,
        val precio: Double,
        val categoria: String,
        val activo: Boolean = true
)

fun main() {
    val p1 = Producto(1, "Teclado mecánico", 89.99, "Periféricos")
    val p2 = Producto(1, "Teclado mecánico", 89.99, "Periféricos")
    val p3 = Producto(2, "Monitor 27\"", 349.99, "Pantallas")

    // toString() automático
    println(p1) // Producto(id=1, nombre=Teclado mecánico, ...)

    // equals() por valor
    println(p1 == p2) // true
    println(p1 == p3) // false

    // copy() — nuevo objeto con cambios puntuales
    val barato = p1.copy(precio = 59.99) // crea una copia de p1 con el precio modificado
    val inactivo = p1.copy(activo = false) // crea una copia de p1 con el activo en false
    println(barato) // Producto(id=1, nombre=Teclado mecánico, ...)
    println(inactivo) // Producto(id=1, nombre=Teclado mecánico, ...)

    // Desestructuración
    val (id, nombre, precio) = p1
    println("$id: $nombre — $$precio")

    // En bucles
    listOf(p1, p3).forEach { (id2, nombre2, precio2) -> println("[$id2] $nombre2: $$precio2") }
}
