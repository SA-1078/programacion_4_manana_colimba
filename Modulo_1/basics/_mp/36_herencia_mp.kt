// Sin open — no se puede heredar (protección por defecto)
// class ElectronicoFinal(val nombre: String)
// class Movil : ElectronicoFinal("X100")  // ERROR — ElectronicoFinal es final

// Con open — la jerarquía está diseñada para ello
open class Electronico(val nombre: String, val marca: String) {
    // open — la subclase PUEDE sobreescribir
    open fun encender() = println("$nombre de $marca: encendiendo...")
    open fun descripcion() = "Soy $nombre de $marca"

    // Sin open — la subclase NO puede sobreescribir
    fun verificarImei() = println("$nombre verificando IMEI")
}

// HERENCIA: Smartphone reutiliza todo de Electronico y especializa encender
class Smartphone(nombre: String, marca: String, val ram: Int) : Electronico(nombre, marca) {
    override fun encender() {
        super.encender()                         // reutiliza la implementación del padre
        println("(cargando sistema Android)")    // añade comportamiento propio
    }
    override fun descripcion() = "${super.descripcion()}, un smartphone con ${ram}GB RAM"
}

class Tablet(nombre: String, marca: String, val esWifi: Boolean) : Electronico(nombre, marca) {
    override fun descripcion() =
        "${super.descripcion()}, una tablet ${if (esWifi) "WiFi" else "con SIM"}"
}

fun main() {
    val movil = Smartphone("Galaxy S24", "Samsung", 12)
    movil.encender()
    // Galaxy S24 de Samsung: encendiendo...
    // (cargando sistema Android)

    val tablet = Tablet("iPad Air", "Apple", true)
    println(tablet.descripcion())  // Soy iPad Air de Apple, una tablet WiFi

    // Herencia — Smartphone y Tablet tienen todo lo de Electronico más lo propio
    movil.verificarImei()  // Galaxy S24 verificando IMEI — heredado de Electronico
}
