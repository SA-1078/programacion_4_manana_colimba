fun main() {
    println("Map inmutable")
    val precios = mapOf(
        "Samsung Galaxy S24" to 999.99,
        "iPhone 15 Pro" to 1299.99,
        "Xiaomi 14" to 699.99,
        "Motorola Edge 40" to 499.99)

    println(precios["Samsung Galaxy S24"])
    println(precios["Huawei P60"])
    println(precios.getOrDefault("Huawei P60", 0.0))
    println(precios.getOrDefault("iPhone 15 Pro", 0.0))
}
