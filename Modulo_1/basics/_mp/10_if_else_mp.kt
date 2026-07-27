sfun main() {
    println("Controles de Flujo Ventas")
    println("Condicional if - else")
    println("Aplica descuento de cliente frecuente? (s/n):")
    val tieneDescuento = readLine()?.trim()?.lowercase() == "s"
    print("Costo base del equipo:")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0
    if (tieneDescuento){
        val costoFinal = costoBase*0.90
        println("Aplica descuento: El cliente paga $${"%.2f".format(costoFinal)}")
    } else {
        println("Pago normal: $${"%.2f".format(costoBase)}")
    }
}
