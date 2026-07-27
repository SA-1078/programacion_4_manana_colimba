// El constructor primario integra la declaración de propiedades
class Dispositivo(val nombre: String, val precio: Double)

// Con cuerpo adicional
class Dispositivo2(val nombre: String, val precio: Double) {
    fun descripcion() = "Equipo: $nombre a $${"%.2f".format(precio)}"
    fun esGamaAlta() = precio >= 800.0
}

fun main() {
    val d = Dispositivo("Samsung Galaxy S24", 999.99)
    println(d.nombre) // Samsung Galaxy S24
    println(d.precio) // 999.99

    val d2 = Dispositivo2("Motorola Edge 40", 499.99)
    println(d2.descripcion()) // Equipo: Motorola Edge 40 a $499.99
    println(d2.esGamaAlta()) // false
}
