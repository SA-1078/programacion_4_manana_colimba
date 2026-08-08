enum class EstadoPedido(val descripcion: String, val esTerminal: Boolean) {
    PENDIENTE("Esperando confirmacion de pago", false),
    CONFIRMADO("Pago confirmado, preparando envio", false),
    ENVIADO("Dispositivo en camino", false),
    ENTREGADO("Dispositivo entregado al cliente", true),
    CANCELADO("Pedido cancelado por el cliente", true);

    fun puedeTransicionarA(siguiente: EstadoPedido): Boolean =
            when (this) {
                PENDIENTE -> siguiente == CONFIRMADO || siguiente == CANCELADO
                CONFIRMADO -> siguiente == ENVIADO || siguiente == CANCELADO
                ENVIADO -> siguiente == ENTREGADO
                else -> false
            }
}

fun main() {
    val estado = EstadoPedido.ENVIADO
    println(estado.descripcion) // Dispositivo en camino
    println(estado.esTerminal) // false

    // when exhaustivo — sin else porque el compilador conoce todos los casos
    val icono =
            when (estado) {
                EstadoPedido.PENDIENTE -> "⏰"
                EstadoPedido.CONFIRMADO -> "✔️"
                EstadoPedido.ENVIADO -> "🚚"
                EstadoPedido.ENTREGADO -> "✅"
                EstadoPedido.CANCELADO -> "🚫"
            }
    println(icono) // 🚚

    println(estado.puedeTransicionarA(EstadoPedido.ENTREGADO)) // true
}
