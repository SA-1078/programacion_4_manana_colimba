fun main() {
    println("Controles de Flujo when con condiciones arbitrarias")
    println("Escriba el precio del dispositivo:")
    val precio = readLine()?.toDoubleOrNull() ?: 0.0
    println("Tiene garantia extendida?: (s/n)")
    val tieneGarantia = readLine()?.trim()?.lowercase() == "s"
    val planGarantia =
            if (tieneGarantia) {
                println("Plan de garantia (BASICO /INTERMEDIO /PREMIUM)")
                readLine()?.trim()?.uppercase() ?: ""
            } else ""
    val descuento =
            when {
                !tieneGarantia && precio < 200.0 -> 0.0
                !tieneGarantia && precio >= 1000.0 -> 50.0
                !tieneGarantia -> 20.0
                planGarantia == "BASICO" -> 30.0
                planGarantia == "INTERMEDIO" -> 60.0
                planGarantia == "PREMIUM" -> 100.0
                else -> 10.0
            }
    println("Descuento aplicado: ${"%.2f".format(descuento)} USD")
}
