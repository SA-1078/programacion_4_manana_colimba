fun main() {
    println("Controles de flujo iteraciones - ciclos repetitivos ciclos for")
    println("For con rango")
    for (i in 1..5) {
        println(i)
    }

    println("For con rango")
    for (i in 1 until 5) {
        println(i)
    }

    println("For con pasos")
    for (i in 1..10 step 3) {
        println(i)
    }

    println("For descendente")
    for (i in 10 downTo 1) {
        println(i)
    }

    println("For con listas")
    val marcas = listOf("Samsung", "Apple", "Xiaomi")
    for (marca in marcas) {
        println(marca)
    }

    println("For con listas index valor")

    for ((index, valor) in marcas.withIndex()) {
        println("$index->$valor")
    }

    println("For con break")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 3) {
            continue
        }
        println("item $i")
    }

    println("For con continue y break")
    for (i in 1..10) {
        if (i == 3) continue
        if (i == 7) break
        println("item $i")
    }

    val dispositivos =
            listOf(
                    Triple("Samsung Galaxy S24", 999.99, 10),
                    Triple("iPhone 15 Pro", 1299.99, 5),
                    Triple("Xiaomi 14", 699.99, 0)
            )

    for ((posicion, dispositivo) in dispositivos.withIndex()) {
        val (nombre, precio, stock) = dispositivo
        val alertaStock = if (stock > 0) "Disponible" else "Sin stock"
        println(
                "Pos $posicion - $nombre - Precio: $${"%.2f".format(precio)} - Stock: $stock ($alertaStock) "
        )
    }
}
