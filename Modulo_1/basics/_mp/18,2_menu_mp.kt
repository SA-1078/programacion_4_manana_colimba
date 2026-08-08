fun main() {
    println("Controles de flujo iteraciones - ciclos repetitivos - ciclo repeat")
    println("Cuantas ventas registrar para calcular promedio diario")
    val ventas = readLine()?.toIntOrNull() ?: 0
    var totalVentas = 0.0
    repeat(ventas) { i ->
        println("Venta ${i + 1} - monto en USD:")
        val monto = readLine()?.toDoubleOrNull() ?: 0.0
        totalVentas += monto
    }
    val promedio = totalVentas / ventas
    println("Promedio de ventas diarias: $${"%.2f".format(promedio)}")
    println("Clasificacion: ${
    when {
        promedio < 500 -> "Ventas bajas"
        promedio <= 2000 -> "Ventas normales"
        else -> "Ventas altas"
    }}")
}
