fun main() {
    println("Funciones")
    val saludo = saludo()
    println("$saludo")
    val total: Double = calcularTotal(999.99, 0.19)
    println(total)
    println("${calcularDescuentoExpresion(999.99, 10.0)}")
    println(calcularDescuentoExpresion(999.99, 10.0))
    println(calcularDescuentoInferido(999.99, 10.0))
    println(bienvenida("Carlos"))
}

fun saludo(): String {
    return "Bienvenido a la Tienda Movil"
}

fun calcularTotal(precio: Double, iva: Double): Double {
    return precio + (precio * iva)
}
// tipo expresion
fun calcularDescuentoExpresion(precio: Double, porcentaje: Double) = precio - (precio * porcentaje / 100)
// inferido
fun calcularDescuentoInferido(precio: Double, porcentaje: Double) = precio - (precio * porcentaje / 100)

fun bienvenida(nombre: String): String {
    return "Hola $nombre, encuentra tu equipo ideal aqui"
}
