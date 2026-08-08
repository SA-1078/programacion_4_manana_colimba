fun main() {
    println("Funciones - Parametros por defecto")
    println(registrarVenta("Galaxy S24", 999.99, "contado", true))
    println(registrarVenta("iPhone 15"))
    println(registrarVenta("Xiaomi 14", 699.99))
    println(registrarVenta("Motorola Edge", 499.99, "credito"))

    //argumentos nombrados
    println(registrarVenta(precio = 299.99, nombre = "Oppo A98", activo = false))
}

fun registrarVenta(
    nombre: String,
    precio: Double = 0.0,
    metodoPago: String = "contado",
    activo: Boolean = true
): String {
    return "Venta[$nombre, precio=$precio, metodo=$metodoPago, activo=$activo]"
}
