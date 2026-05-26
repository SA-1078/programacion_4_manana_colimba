class CarritoCompra(cliente: String, saldoInicial: Double) {

    val cliente: String = cliente // público — cualquiera puede leer
    private var saldo: Double = saldoInicial // privado — solo esta clase lo modifica
    internal val codigoCarrito: String = // internal — visible en el mismo módulo
            "CART${(100000..999999).random()}"
    protected open fun calcularDescuentoFidelidad(): Double = saldo * 0.05 // protected — visible en subclases

    // El saldo solo cambia a través de estos métodos — NUNCA directamente
    fun agregarFondos(monto: Double) {
        require(monto > 0) { "El monto debe ser positivo" }
        saldo += monto
        println("Fondos agregados: $${"%.2f".format(monto)} | Saldo actual: ${consultarSaldo()}")
    }

    fun realizarCompra(monto: Double): Boolean {
        require(monto > 0) { "El monto debe ser positivo" }
        if (monto > saldo) {
            println("Saldo insuficiente para la compra")
            return false
        }
        saldo -= monto
        println("Compra realizada: $${"%.2f".format(monto)} | Saldo restante: ${consultarSaldo()}")
        return true
    }

    fun consultarSaldo(): String = "$${"%.2f".format(saldo)}"
}

fun main() {
    val carrito = CarritoCompra("Ana García", 1500.0)

    carrito.agregarFondos(500.0) // Fondos agregados: $500.00 | Saldo actual: $2000.00
    carrito.realizarCompra(999.99) // Compra realizada: $999.99 | Saldo restante: $1000.01
    carrito.realizarCompra(5000.0) // Saldo insuficiente

    println(carrito.cliente) // Ana García — acceso público permitido
    println(carrito.consultarSaldo()) // $1000.01
    // carrito.saldo = 999999.0       // ERROR — saldo es privado
}
