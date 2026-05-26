class Cliente(val nombre: String, val email: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        // Encapsulamiento en acción: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(email.contains("@")) { "Email inválido: $email" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail      = email.substringAfter("@")
    }
}

fun main() {
    val c = Cliente("  Carlos Ruiz  ", "carlos@tiendamovil.com")
    println(c.nombreNormalizado)  // carlos ruiz
    println(c.dominioEmail)       // tiendamovil.com

    // Cliente("", "invalido")   // IllegalArgumentException — require falla
}
