fun main() {
    println("Controles de Flujo")
    println("Condicional if - anidado")
    
    println("Tiene antecedentes cardiacos? (s/n):")
    val tieneAntecedentes = readLine()?.trim()?.lowercase() == "s"
    
    print("Frecuencia Cardiaca (lpm): ")
    val frecuencia = readLine()?.toIntOrNull() ?: 0

    if (tieneAntecedentes) {
        print("Paciente con antecedentes cardiacos: ")
        // Ordenamos de los extremos hacia el centro o con rangos claros
        if (frecuencia < 50) {
            println("Bradicardia severa")
        } else if (frecuencia > 100) {
            println("Taquicardia")
        } else {
            println("Frecuencia Normal")
        }
    } else {
        println("Paciente sin antecedentes cardiacos")
        if (frecuencia < 50 || frecuencia > 100) {
            println("Alerta: Frecuencia fuera del rango normal")
        } else {
            println("Frecuencia Cardiaca Normal")
        }
    }
}