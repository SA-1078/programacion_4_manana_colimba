fun main() {
    println("Controles de Flujo when")
    println("Escribe codigo")
    val codigo = readLine()?.toIntOrNull()?: 0
    val especialidad = when(codigo){
        1->"Medicina general"
        2-> "Pedriatria"
        3-> "Cardiologia"
        4-> "Ginecologia"
        5-> "Neurologia"
        6-> "Dermatologia"
        else -> "Especialidad no registrada en el sistema"
    }
    println("Especialidad: $especialidad")

}

fun main() {
    println("Controles de Flujo when")
    println("Seleccione el tipo de procesamiento:") 
    println("1. Sangre venosa")
    println("2. Orina") 
    println("3. Heces") 
    println("4. Hisopado nasofaringeo") 
    println("5. Biopsia")
    println("Escriba su respuesta (1-5): ")
    val codigo = readLine()?.toIntOrNull()?: 0
    val procesamiento = when(codigo){
        1->"Sangre venosa - tiempo estimado: 2h"
        2-> "Orina - tiempo estimado: 1h"
        3-> "Heces - tiempo estimado: 1h"
        4-> "Hisopado nasofaringeo - - tiempo estimado: 2h"
        5-> "Biopsia - tiempo estimado: 3h"
        else -> "Especialidad no registrada en el sistema"
    }
    println("Tipo de muestra: $procesamiento", )