package modulo1.basics.p25mp

// El usuario de esta clase solo sabe QUÉ puede hacer con un DispositivoMovil
// No necesita saber cómo se calcula precioConIva ni cómo funciona disponible
class DispositivoMovil(
        val id: Int,
        val nombre: String,
        val precio: Double,
        private val stock: Int // privado — el usuario no manipula el stock directamente
) {
    val precioConIva: Double // interfaz pública — qué puede consultar
        get() = precio * 1.19

    val disponible: Boolean
        get() = stock > 0

    override fun toString() = "$nombre ($${"%.2f".format(precio)})"
}

fun main() {
    val samsung = DispositivoMovil(1, "Samsung Galaxy S24", 999.99, 15)

    // El código externo usa la interfaz pública — no sabe el detalle interno
    println(samsung.disponible) // true
    println(samsung.precioConIva) // 1189.99
    // samsung.stock = 0           // ERROR — privado, protegido por diseño
}
