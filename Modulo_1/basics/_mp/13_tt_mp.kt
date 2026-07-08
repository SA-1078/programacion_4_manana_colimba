fun main() {
    println("Controles de Flujo Ventas")
    print("Escriba el codigo de la marca del dispositivo")
    val codigo = readLine()?.toIntOrNull()?: 0
    val marca = when(codigo){
        1 -> "Apple"
        2 -> "Samsung"
        3 -> "Xiaomi"
        4 -> "Motorola"
        5 -> "Huawei"
        6 -> "Oppo"
        else -> "Marca no registrada en la tienda"
    }
    println("Marca seleccionada: $marca")
}
