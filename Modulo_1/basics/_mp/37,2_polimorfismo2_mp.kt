// La interfaz define el contrato — QUÉ puede hacer
// Las implementaciones definen el CÓMO
interface MetodoPago {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(val numero: String) : MetodoPago {
    override val nombre = "Tarjeta de crédito"
    override fun procesar(monto: Double): Boolean {
        println("💳 Cargando $${"%.2f".format(monto)} a tarjeta $numero")
        return true
    }
}

class Nequi(val telefono: String) : MetodoPago {
    override val nombre = "Nequi"
    override fun procesar(monto: Double): Boolean {
        println("📱 Enviando $${"%.2f".format(monto)} a Nequi $telefono")
        return true
    }
}

class Efectivo : MetodoPago {
    override val nombre = "Efectivo"
    override fun procesar(monto: Double): Boolean {
        println("💵 Recibiendo $${"%.2f".format(monto)} en efectivo")
        return true
    }
}

// Esta función no sabe ni le importa qué tipo de pago es
// Solo sabe que recibe algo que implementa MetodoPago — POLIMORFISMO
fun cobrarDispositivo(monto: Double, metodoPago: MetodoPago) {
    println("Procesando pago con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Pago exitoso" else "❌ Pago fallido")
}

fun main() {
    val metodos: List<MetodoPago> = listOf(
        TarjetaCredito("**** **** **** 5678"),
        Nequi("3001234567"),
        Efectivo()
    )

    // Misma función — comportamiento distinto según el tipo
    metodos.forEach { cobrarDispositivo(999.99, it) }
}
