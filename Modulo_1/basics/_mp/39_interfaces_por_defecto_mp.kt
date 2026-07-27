interface Exportable {
    val id: String // abstracta — debe implementarse
    fun exportar(): String // abstracta — debe implementarse
    val version: Int
        get() = 1 // con default — puede sobreescribirse
}

interface Verificable {
    val errores: List<String>
    val esValido: Boolean
        get() = errores.isEmpty()

    fun verificar(): Boolean
    fun imprimirErrores() { // implementación por defecto
        if (errores.isEmpty()) println("Sin errores") else errores.forEach { println("  ❌ $it") }
    }
}

// POLIMORFISMO: OrdenVenta puede usarse donde se espere Exportable O Verificable
data class OrdenVenta(
        override val id: String,
        val cliente: String,
        val dispositivos: List<String>,
        val total: Double
) : Exportable, Verificable {

    override fun exportar() = "$id|$cliente|${dispositivos.joinToString(",")}|$total"

    override val errores: List<String>
        get() = buildList {
            if (cliente.isBlank()) add("El cliente no puede estar vacío")
            if (dispositivos.isEmpty()) add("La orden debe tener al menos un dispositivo")
            if (total <= 0) add("El total debe ser mayor que cero")
        }

    override fun verificar() = esValido
}

fun main() {
    val orden1 = OrdenVenta("ORD-001", "Carlos", listOf("Galaxy S24", "AirPods"), 1149.98)
    val orden2 = OrdenVenta("ORD-002", "", emptyList(), -5.0)

    // Polimorfismo por interfaz
    fun procesarExportable(e: Exportable) = println("→ ${e.exportar()}")
    fun procesarVerificable(v: Verificable) {
        println("Válido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarExportable(orden1) // → ORD-001|Carlos|Galaxy S24,AirPods|1149.98
    procesarVerificable(orden1) // Válido: true / Sin errores
    procesarVerificable(orden2) // Válido: false / ❌ ...
}
