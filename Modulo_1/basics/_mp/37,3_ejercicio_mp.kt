interface FormaPagoMovil {
    val nombre: String
    fun validar(): Boolean
    fun procesar(monto: Double): Boolean
    var tipo: String
}

open class PagoMovil : FormaPagoMovil {
    override var tipo: String = "Pago"
    override val nombre: String
        get() = tipo

    override fun validar(): Boolean {
        println("Validando $tipo...")
        return true
    }

    override fun procesar(monto: Double): Boolean {
        println("Procesando compra de dispositivo por $${"%.2f".format(monto)}")
        return true
    }
}

class TransferenciaBancaria(private var numeroCuenta: String) : PagoMovil() {
    override var tipo: String = "Transferencia Bancaria"
    override fun validar(): Boolean {
        println("Número de cuenta: $numeroCuenta")
        return super.validar()
    }

    override fun procesar(monto: Double): Boolean {
        println("Transfiriendo $${"%.2f".format(monto)} desde cuenta $numeroCuenta")
        return true
    }
}

class EfectivoTienda : PagoMovil() {
    override var tipo: String = "Efectivo en Tienda"

    override fun procesar(monto: Double): Boolean {
        println("Recibido en caja: $${"%.2f".format(monto)}")
        return true
    }
}

fun ejecutarVenta(monto: Double, metodo: FormaPagoMovil) {
    println("Usando ${metodo.tipo}")

    if (metodo.validar()) {
        val ok = metodo.procesar(monto)
        println(if (ok) "✅ Venta completada" else "❌ Error en la venta")
    } else {
        println("❌ No válido")
    }
}

fun main() {
    val metodos: List<FormaPagoMovil> = listOf(
        TransferenciaBancaria("COL12345678901234567890"),
        EfectivoTienda()
    )

    for (m in metodos) {
        println(m.nombre)
    }
}
