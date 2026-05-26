class PantallaDispositivo(val ancho: Double, val alto: Double) {
    val area: Double
        get() = ancho * alto
    val diagonal: Double
        get() = Math.sqrt(ancho * ancho + alto * alto)

    // Siempre llaman al constructor primario con this(...)
    constructor(lado: Double) : this(lado, lado)
    constructor(ancho: Int, alto: Int) : this(ancho.toDouble(), alto.toDouble())

    override fun toString() = "Pantalla(${ancho}x${alto} cm) | área=${area} cm²"
}

fun main() {
    val p1 = PantallaDispositivo(15.0, 7.0)
    val p2 = PantallaDispositivo(6.5) // cuadrado
    val p3 = PantallaDispositivo(16, 9) // c  
    println(p1) // Pantalla(15.0x7.0 cm) | área=105.0 cm²
    println(p2) // Pantalla(6.5x6.5 cm) | área=42.25 cm²
}
