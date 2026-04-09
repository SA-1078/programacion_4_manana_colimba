fun main() {
    println("Controles de Flujo")
    println("Condicional if - else")
    println("Tiene seguro medico s/n:")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"
    print("Costo base:")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0
    if (tieneSeguro){
        val cobertura = costoBase*0.80
        println("Seguro cubre: $${"%.2f".format(cobertura)}")
    } else {
        println("Pago particular: $${"%.2f".format(costoBase)}")
    }
}
