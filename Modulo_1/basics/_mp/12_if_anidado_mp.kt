fun main() {
    println("Controles de Flujo")
    println("Condicional if - anidado")
    
    println("El equipo es reacondicionado? (s/n):")
    val esReacondicionado = readLine()?.trim()?.lowercase() == "s"
    
    print("Porcentaje de condicion de bateria (%): ")
    val condicionBateria = readLine()?.toIntOrNull() ?: 0

    if (esReacondicionado) {
        print("Equipo Reacondicionado: ")
        // Ordenamos de los extremos hacia el centro o con rangos claros
        if (condicionBateria < 80) {
            println("No apto para venta premium")
        } else if (condicionBateria >= 95) {
            println("Grado A+")
        } else {
            println("Grado A")
        }
    } else {
        println("Equipo Nuevo de Fabrica")
        if (condicionBateria < 100 || condicionBateria > 100) {
            println("Alerta: La bateria de un equipo nuevo deberia ser 100%")
        } else {
            println("Bateria en perfecto estado")
        }
    }
}
