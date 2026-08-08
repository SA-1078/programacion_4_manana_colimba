class ModeloInmutable(val imei: String, val marca: String)   // solo lectura

class ContadorVentas(var total: Int = 0) {                   // lectura y escritura
    fun registrarVenta() { total++ }
    fun resetear()       { total = 0 }
}

// Sin val/var — parámetro del constructor, NO propiedad
// Solo accesible dentro del bloque init
class RegistroTemporal(codigo: String) {
    val codigoUpper = codigo.uppercase()
    // codigo no existe fuera de aquí
}
