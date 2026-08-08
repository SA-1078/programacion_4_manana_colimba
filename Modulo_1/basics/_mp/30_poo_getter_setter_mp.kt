class PrecioDispositivo(precio: Double) {

    // ENCAPSULAMIENTO: el setter valida antes de asignar
    var precio: Double = precio
        set(value) {
            require(value >= 0) { "El precio no puede ser negativo" }
            field = value // 'field' es el backing field
        }

    // ABSTRACCIÓN: el usuario consulta el precio con IVA sin saber la fórmula
    val precioConIva: Double
        get() = precio * 1.19

    val precioConDescuento10: Double
        get() = precio * 0.90

    val categoria: String
        get() =
                when {
                    precio < 200 -> "Gama baja"
                    precio < 600 -> "Gama media"
                    precio < 1000 -> "Gama alta"
                    else -> "Premium"
                }
}

fun main() {
    val disp = PrecioDispositivo(699.99)
    println("${"%.2f".format(disp.precio)} USD base — ${"%.2f".format(disp.precioConIva)} USD con IVA")
    println(disp.categoria) // Gama alta

    disp.precio = 199.99
    println("${"%.2f".format(disp.precio)} USD → ${disp.categoria}") // Gama baja

    // disp.precio = -50.0  // IllegalArgumentException
}
