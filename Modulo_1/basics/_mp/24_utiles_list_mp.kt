fun main() {
    println("Utilidades list")
    val precios = listOf(299.99, 499.99, 699.99, 999.99, 1299.99, 149.99, 89.99, 59.99, 39.99, 19.99)
    println(precios)
    val preciosConIva = precios.map { it * 1.19 }
    println(preciosConIva)
    val preciosTexto = precios.map { "Precio: $$it" }
    println(preciosTexto)

    println("Filter")
    val gamaMedia = precios.filter { it in 300.0..800.0 }
    println(gamaMedia)
    val gamaAlta = precios.filter { it > 800.0 }
    println(gamaAlta)
    val gamaMedioAlta = precios.filter { it > 500.0 && it <= 1000.0 }
    println(gamaMedioAlta)
    val accesiblesGamaAlta = precios.filter { it < 500.0 }
    println(accesiblesGamaAlta)

    val catalogo = listOf<Any>(999.99, "Samsung", 699.99, "Apple", true, 42)
    val soloMarcas = catalogo.filterIsInstance<String>()
    println(soloMarcas)

    println("reduce")
    val preciosReduce = listOf(299.99, 499.99, 699.99, 999.99, 1299.99)
    val suma = preciosReduce.reduce { acc, n -> acc + n }
    println(suma)
    val productoVerificacion = preciosReduce.reduce { acc, n -> acc * n }
    println(productoVerificacion)
    println("fold")
    val sumaFold = preciosReduce.fold(100.0) { acc, n -> acc + n }
    println(sumaFold)
    val productoFold = preciosReduce.fold(1.0) { acc, n -> acc * n }
    println(productoFold)

    println("Ordenacion")
    println("Ascendente: $precios.sorted()")
    println("Descendente: ${precios.sortedDescending()}")
    println("Sorted By: ${precios.sortedBy { -it }}")
    println("Agregacion")
    println("Sumar: ${precios.sum()}")
    println("Promedio: ${precios.average()}")
    println("Minimo: ${precios.min()}")
    println("Maximo: ${precios.max()}")
    println("Contar: ${precios.count()}")
    println("Contar gama alta: ${precios.count { it > 800.0 }}")
    println("Busqueda")
    println("Buscar primer precio mayor a 500: ${precios.find { it > 500.0 }}")
    println("Buscar ultimo precio mayor a 500: ${precios.findLast { it > 500.0 }}")
    println("Buscar any mayor a 1000: ${precios.any { it > 1000.0 }}")
    println("Buscar all mayor a 1000: ${precios.all { it > 1000.0 }}")
    println("Buscar none mayor a 1000: ${precios.none { it > 1000.0 }}")
}
