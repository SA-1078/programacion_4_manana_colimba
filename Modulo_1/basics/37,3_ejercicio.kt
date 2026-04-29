interface FormaPago {
    val nombre: String
    fun validar(): Boolean
    fun procesar(monto: Double): Boolean
    var tipo: String
}

open class Pago : FormaPago {
    override var tipo: String = "Pago"
    override val nombre: String
        get() = tipo

    override fun validar(): Boolean {
        println("Validando $tipo...")
        return true
    }

    override fun procesar(monto: Double): Boolean {
        println("Procesando pago de $${"%.2f".format(monto)}")
        return true
    }
}

class Cheque(private var numeroCheque: String) : Pago() {
    override var tipo: String = "Cheque"
    override fun validar(): Boolean {
        println("Número de cheque: $numeroCheque")
        return super.validar()
    }

    override fun procesar(monto: Double): Boolean {
        println("Cobrando cheque $numeroCheque por $${"%.2f".format(monto)}")
        return true
    }
}

class Efectivo : Pago() {
    override var tipo: String = "Efectivo"

    override fun procesar(monto: Double): Boolean {
        println("Recibido en efectivo: $${"%.2f".format(monto)}")
        return true
    }
}

fun ejecutarPago(monto: Double, metodo: FormaPago) {
    println("Usando ${metodo.tipo}")

    if (metodo.validar()) {
        val ok = metodo.procesar(monto)
        println(if (ok) "✅ Pago correcto" else "❌ Error en pago")
    } else {
        println("❌ No válido")
    }
}

fun main() {
    val metodos: List<FormaPago> = listOf(
        Cheque("CHK-001234"),
        Efectivo()
    )

    for (m in metodos) {
        println(m.nombre)
    }
}

