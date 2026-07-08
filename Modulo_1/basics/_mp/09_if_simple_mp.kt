fun main() {
    println("Controles de Flujo Ventas")
    println("Condicional if")
    println("Incluir precio del celular : ")
    val precioCelular = readLine()?.toDoubleOrNull()?: 500.0
    if (precioCelular>=800.0){
        println("Celular de gama alta: ofrecer seguro extendido")
    }
    if (precioCelular>=1200.0){
        print("Celular premium: ofrecer audifonos de regalo")
    }
    print("Precio final registrado: $precioCelular dolares")
}
