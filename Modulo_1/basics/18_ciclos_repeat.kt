fun main() {
    println("Controles de flujo iteraciones. Ciclos repetitivos. Ciclo While")

    println("While Basico")
    var contador = 1
    while (contador <= 5) {
        println(contador)
        contador++
    }

    println("Do while")
    contador = 1
    do {
        println(contador)
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
        println("Usted ingresó: $input")
    }

    // FRECUENCIA CARDIACA
    println("Cuantas pulsaciones tomar para calcular frecuencia cardiaca")
    val mediciones = readLine()?.toIntOrNull() ?: 0
    var totalPulsaciones = 0

    repeat(mediciones) { i ->
        println("Medicion ${i + 1} (pulsos en 15 seg.)")
        val pulsos = readLine()?.toIntOrNull() ?: 0
        totalPulsaciones += pulsos * 4
    }

    if (mediciones > 0) {
        val promedio = totalPulsaciones / mediciones
        println("Frecuencia cardiaca promedio : $promedio lpm")

        println("Clasificacion: ${
            when {
                promedio < 60 -> "Bradicardia"
                promedio <= 100 -> "Normal"
                else -> "Taquicardia"
            }
        }")
    } else {
        println("No hay mediciones.")
    }
}