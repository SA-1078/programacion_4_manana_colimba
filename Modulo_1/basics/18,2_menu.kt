fun main() {
    println("Controles de flujo iteraciones - ciclos repetitivos - ciclo repeat")
    println("Cuantas pulsaciones tomar para calcular frecuencia cardiaca")
    val mediciones = readLine()?.toIntOrNull()?:0
    var totalPulsaciones = 0
    repeat(mediciones){i -> 
        println("Medicion ${i+1} (pulsos en 15 seg.)")
        val pulsos = readLine()?.toIntOrNull()?:0
        totalPulsaciones+= pulsos * 4 //para 60 segs
    }
    val promedio = totalPulsaciones / mediciones
    println("Frecuencia cardiaca promedio: $promedio lpm")
    println("Clasificacion: ${
    when{
        promedio < 60 -> "Bradicardia"
        promedio <= 100 -> "Normal"
        else -> "Taquicardia"
    }}")
}