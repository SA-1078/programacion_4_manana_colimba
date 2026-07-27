fun main() {
    println("Controles de flujo iteraciones. Ciclos repetitivos. Ciclo While")

    println("While Basico")
    var contador = 1
    while (contador <= 5) {
        println("Revisando dispositivo #$contador")
        contador++
    }

    println("Do while")
    contador = 1
    do {
        println("Cargando equipo #$contador")
        contador++
    } while (contador <= 5)

    println("Break continue")
    contador = 1
    while (contador <= 10) {
        contador++
        if (contador == 3) continue
        if (contador == 7) break
        println(contador)
    }

    var input: String
    while (true) {
        println("Escribe 'Salir' para terminar")
        input = readLine()?.lowercase() ?: ""
        if (input == "salir") break
        println("Buscando dispositivo: $input")
    }

    // VENTAS DIARIAS
    println("Cuantas ventas registrar para calcular promedio diario")
    val ventas = readLine()?.toIntOrNull() ?: 0
    var totalVentas = 0.0

    repeat(ventas) { i ->
        println("Venta ${i + 1} - monto en USD:")
        val monto = readLine()?.toDoubleOrNull() ?: 0.0
        totalVentas += monto
    }

    if (ventas > 0) {
        val promedio = totalVentas / ventas
        println("Promedio de ventas diarias: $${"%.2f".format(promedio)}")

        println("Clasificacion: ${
            when {
                promedio < 500 -> "Ventas bajas"
                promedio <= 2000 -> "Ventas normales"
                else -> "Ventas altas"
            }
        }")
    } else {
        println("No hay ventas registradas.")
    }
}
