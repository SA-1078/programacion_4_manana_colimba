/**
 * Ejercicio 2 — Encapsulamiento con ProductoInventario
 * Fundamentos de POO en Kotlin
 *
 * Demuestra el encapsulamiento protegiendo precio y stock con acceso
 * controlado a través de métodos públicos con validaciones.
 */

class ProductoInventario(
    val codigo: String,
    val nombre: String,
    precio: Double,
    stock: Int
) {
    // Atributos privados — solo se modifican a través de los métodos de esta clase
    private var precio: Double = precio
    private var stock: Int = stock

    init {
        require(precio >= 0) { "El precio no puede ser negativo al crear el producto" }
        require(stock >= 0) { "El stock inicial no puede ser negativo" }
    }

    // ──────────────── CONSULTAS ────────────────

    /** Retorna el precio actual del producto. */
    fun consultarPrecio(): Double = precio

    /** Retorna el stock actual del producto. */
    fun consultarStock(): Int = stock

    /** Muestra el estado completo del producto. */
    fun mostrarEstado() {
        println("┌─────────────────────────────────────┐")
        println("│ Código  : $codigo")
        println("│ Nombre  : $nombre")
        println("│ Precio  : \$${"%.2f".format(precio)}")
        println("│ Stock   : $stock unidades")
        println("└─────────────────────────────────────┘")
    }

    // ──────────────── ACTUALIZACIÓN DE STOCK ────────────────

    /**
     * Aumenta el stock del producto.
     * @param cantidad Cantidad a agregar (debe ser positiva).
     */
    fun aumentarStock(cantidad: Int) {
        if (cantidad <= 0) {
            println("La cantidad a agregar debe ser mayor que cero.")
            return
        }
        stock += cantidad
        println("Stock aumentado en $cantidad. Nuevo stock de \"$nombre\": $stock")
    }

    /**
     * Disminuye el stock del producto.
     * El stock no puede quedar por debajo de cero.
     * @param cantidad Cantidad a retirar (debe ser positiva y no mayor al stock actual).
     */
    fun disminuirStock(cantidad: Int) {
        if (cantidad <= 0) {
            println("La cantidad a retirar debe ser mayor que cero.")
            return
        }
        if (cantidad > stock) {
            println("Stock insuficiente. Stock actual: $stock, intentaste retirar: $cantidad")
            return
        }
        stock -= cantidad
        println("Stock reducido en $cantidad. Nuevo stock de \"$nombre\": $stock")
    }

    // ──────────────── ACTUALIZACIÓN DE PRECIO ────────────────

    /**
     * Cambia el precio del producto.
     * El precio no puede ser negativo.
     * @param nuevoPrecio Nuevo precio a establecer.
     */
    fun cambiarPrecio(nuevoPrecio: Double) {
        if (nuevoPrecio < 0) {
            println("El precio no puede ser negativo. Precio rechazado: \$${"%.2f".format(nuevoPrecio)}")
            return
        }
        val precioAnterior = precio
        precio = nuevoPrecio
        println("Precio de \"$nombre\" actualizado: \$${"%.2f".format(precioAnterior)} → \$${"%.2f".format(precio)}")
    }
}

fun main() {
    println("=== EJERCICIO 2: Encapsulamiento con ProductoInventario ===\n")

    val producto = ProductoInventario(
        codigo = "PROD-001",
        nombre = "Laptop Gaming Asus ROG",
        precio = 1500.0,
        stock = 20
    )

    println("Estado inicial:")
    producto.mostrarEstado()

    println("\n--- Operaciones de stock ---")
    producto.aumentarStock(10)
    producto.disminuirStock(5)
    producto.disminuirStock(100) // intento inválido — más de lo disponible
    producto.disminuirStock(-3) // intento inválido — cantidad negativa

    println("\n--- Operaciones de precio ---")
    producto.cambiarPrecio(1350.0)
    producto.cambiarPrecio(-500.0) // intento inválido — precio negativo

    println("\nEstado final:")
    producto.mostrarEstado()

    println("\n--- Consultas individuales ---")
    println("Precio actual : \$${"%.2f".format(producto.consultarPrecio())}")
    println("Stock actual  : ${producto.consultarStock()} unidades")
}
