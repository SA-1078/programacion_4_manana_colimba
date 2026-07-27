fun main() {
    println("set inmutable")
    val precios = setOf(999, 699, 1299, 499, 999, 699)
    println("precios set: ${precios}")

    println("Operaciones de conjuntos")
    val gamaAlta = setOf("Samsung Galaxy S24", "iPhone 15 Pro", "Pixel 8 Pro")
    val conConectividad5g = setOf("Samsung Galaxy S24", "Xiaomi 14", "Pixel 8 Pro")
    println("gama alta set: ${gamaAlta}")
    println("con 5G set: ${conConectividad5g}")

    println("union : ${gamaAlta union conConectividad5g}")
    println("intersección : ${gamaAlta intersect conConectividad5g}")
    println("substraccion : ${gamaAlta subtract conConectividad5g}")

    println("gama alta set: ${gamaAlta}")
    println("con 5G set: ${conConectividad5g}")

    println("Set Mutable")
    val categorias = mutableSetOf("smartphones", "tablets", "accesorios")
    println(categorias)
    categorias.add("smartphones")
    categorias.add("wearables")
    categorias.remove("tablets")
    println(categorias)
}
