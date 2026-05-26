/**
 * Ejercicio 4 — Polimorfismo con métodos de pago
 * Fundamentos de POO en Kotlin
 *
 * Se define una interfaz MetodoPago con el método procesarPago().
 * Tres clases la implementan de forma distinta: PagoEfectivo,
 * PagoTarjeta y PagoTransferencia. Se recorre una lista y se
 * demuestra el polimorfismo en acción.
 */

// ──────────────── INTERFAZ ────────────────

/**
 * Contrato que debe cumplir cualquier método de pago.
 */
interface MetodoPago {
    val nombre: String
    fun procesarPago(monto: Double): Boolean
}

// ──────────────── IMPLEMENTACIONES ────────────────

/**
 * Pago en efectivo — el cajero recibe el dinero directamente.
 */
class PagoEfectivo : MetodoPago {
    override val nombre = "Efectivo"

    override fun procesarPago(monto: Double): Boolean {
        println("[EFECTIVO] Recibiendo \$${"%.2f".format(monto)} en caja.")
        println("   → Entregue el cambio correspondiente si aplica.")
        return true
    }
}

/**
 * Pago con tarjeta de crédito o débito.
 * @param numeroTarjeta Últimos 4 dígitos de la tarjeta (para mostrar).
 * @param tipo          "Crédito" o "Débito".
 */
class PagoTarjeta(
    private val numeroTarjeta: String,
    private val tipo: String = "Crédito"
) : MetodoPago {
    override val nombre = "Tarjeta $tipo"

    override fun procesarPago(monto: Double): Boolean {
        println("[TARJETA $tipo] Cobrando \$${"%.2f".format(monto)} a tarjeta terminada en $numeroTarjeta.")
        println("→ Verificando fondos... Aprobado ")
        return true
    }
}

/**
 * Pago mediante transferencia bancaria.
 * @param cuentaDestino Número de cuenta destino.
 * @param banco         Nombre del banco.
 */
class PagoTransferencia(
    private val cuentaDestino: String,
    private val banco: String
) : MetodoPago {
    override val nombre = "Transferencia $banco"

    override fun procesarPago(monto: Double): Boolean {
        println("[TRANSFERENCIA - $banco] Enviando \$${"%.2f".format(monto)} a cuenta $cuentaDestino.")
        println("→ Comprobante generado. Tiempo de acreditación: 1-2 horas.")
        return true
    }
}

// ──────────────── FUNCIÓN DE COBRO ────────────────

/**
 * Procesa el cobro sin importar qué método de pago se usa — POLIMORFISMO.
 */
fun realizarCobro(monto: Double, metodo: MetodoPago) {
    println("\n>>> Procesando pago con ${metodo.nombre}...")
    val exitoso = metodo.procesarPago(monto)
    println("Resultado: ${if (exitoso) "Pago completado" else "Pago rechazado"}")
}

fun main() {
    println("=== EJERCICIO 4: Polimorfismo con Métodos de Pago ===\n")

    // Crear lista de métodos de pago — todos del tipo MetodoPago (polimorfismo)
    val metodos: List<MetodoPago> = listOf(
        PagoEfectivo(),
        PagoTarjeta("4321", "Crédito"),
        PagoTarjeta("8765", "Débito"),
        PagoTransferencia("COL1234567890", "Bancolombia"),
        PagoTransferencia("ES9121000418401234567891", "Davivienda")
    )

    val montoCompra = 250.000

    println("Monto a cobrar: \$${"%.2f".format(montoCompra)}")
    println("=".repeat(50))

    // Recorrer la lista y ejecutar el pago — misma llamada, comportamiento diferente
    metodos.forEach { metodo ->
        realizarCobro(montoCompra, metodo)
        println("-".repeat(50))
    }

    println("\n=== Resumen de métodos disponibles ===")
    metodos.forEachIndexed { i, m -> println("  ${i + 1}. ${m.nombre}") }
}
