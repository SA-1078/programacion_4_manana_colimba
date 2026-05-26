fun main() {
    println("Controles de Flujo When con bloques de codigos")
    println("Nombre del cliente: ")
    val nombreCliente = readLine()?.trim()?.lowercase() ?: "Sin identificacion"
    println("Tiene estado del pedido (ENVIADO/EN_CAMINO/ENTREGADO/CANCELADO)")
    val estado = readLine()?.trim()?.uppercase() ?: ""

    when (estado) {
        "ENVIADO" -> {
            println("PEDIDO ENVIADO: Cliente: $nombreCliente")
            println("El dispositivo ha salido del almacen")
            println("Tiempo estimado de entrega: 3-5 dias habiles")
        }
        "EN_CAMINO" -> {
            println("EN CAMINO: Cliente: $nombreCliente")
            println("El dispositivo esta en ruta de entrega")
            println("Revisar tracking en la app")
        }
        "ENTREGADO" -> {
            println("ENTREGADO: Cliente: $nombreCliente")
            println("El dispositivo fue entregado exitosamente")
        }
        "CANCELADO" -> {
            println("CANCELADO: Pedido del cliente $nombreCliente cancelado")
            println("Se procedera el reembolso en 5-7 dias habiles")
        }
        else -> println("Estado no reconocido")
    }
}
