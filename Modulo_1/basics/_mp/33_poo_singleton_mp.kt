object ConfiguracionTienda {
    val nombre: String = "TechMobile Store"
    val ciudad: Int = 443
    private val apiKey: String = "tm-secreto-456" // privado — nunca expuesto

    fun baseUrl() = "https://api.techmobilestore.com"
    fun headers() = mapOf("Authorization" to "Bearer $apiKey")
}

class Vendedor private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        // Factory function — encapsulamiento del constructor
        fun crear(nombre: String, email: String): Vendedor? {
            if (nombre.isBlank() || !email.contains("@")) return null
            return Vendedor(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "asesor"
    }
}

fun main() {
    println(ConfiguracionTienda.baseUrl()) // https://api.techmobilestore.com
    // ConfiguracionTienda.apiKey            // ERROR — privado

    val v = Vendedor.crear("Laura", "laura@tiendamovil.com")
    println(v) // Vendedor(id=1, nombre=Laura)
}
