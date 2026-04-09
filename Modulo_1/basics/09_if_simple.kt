fun main() {
    println("Controles de Flujo")
    println("Condicional if")
    println("Incluir temperatura en grados centigrados : ")
    val temperatura = readLine()?:toDoubleOrNull()?: 36.5
    if (temperatura>=38.0){
        println("Fiebre detectada: derivar consulta prioritaria)
    }
    if (temperatura>=40.0){
        print("Fiebre alta: atencion de emergencia inmediata")
    }
    print("Temperatura registrada: $temperatura grados
        centigrados")
}