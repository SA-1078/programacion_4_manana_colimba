fun main() {
    println("Utilidades list")
    val numeros = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    println(numeros)
    val cuadrados = numeros.map { it * it }
    println(cuadrados)
    val numerosTexto = numeros.map { "Num: $it" }
    println(numerosTexto)

    println("Filter")
    val pares = numeros.filter { it % 2 == 0 }
    println(pares)
    val mayoresA5 = numeros.filter { it > 5 }
    println(mayoresA5)
    val paresMayores5 = numeros.filter { it % 2 == 0 && it > 5 }
    println(paresMayores5)
    val impares = numeros.filter { it % 2 != 0 }
    println(impares)

    val mezcla = listOf<Any>(1, "Hola", 2, "Mundo", true, 42)
    val soloString = mezcla.filterIsInstance<String>()
    println(soloString)

    println("reduce")
    val numerosReduce = listOf(1, 2, 3, 4, 5)
    val suma = numerosReduce.reduce { acc, n -> acc + n }
    println(suma)
    val producto = numerosReduce.reduce { acc, n -> acc * n }
    println(producto)
    println("fold")
    val sumaFold = numerosReduce.fold(100) { acc, n -> acc + n }
    println(sumaFold)
    val productoFold = numerosReduce.fold(100) { acc, n -> acc * n }
    println(productoFold)

    println("Ordenacion")
    println("Ascendente: $numeros.sorted()")
    println("Descendente: ${numeros.sortedDescending()}")
    println("Sorted By: ${numeros.sortedBy { -it }}")
    println("Agregacion")
    println("Sumar: ${numeros.sum()}")
    println("Promedio: ${numeros.average()}")
    println("Minimo: ${numeros.min()}")
    println("Maximo: ${numeros.max()}")
    println("Contar: ${numeros.count()}")
    println("Contar pares: ${numeros.count { it > 4 }}")
    println("Busqueda")
    println("Buscar: ${numeros.find { it > 4 }}")
    println("Buscar ultimo: ${numeros.findLast { it > 4 }}")
    println("Buscar any: ${numeros.any { it > 4 }}")
    println("Buscar all: ${numeros.all { it > 4 }}")
    println("Buscar none: ${numeros.none { it > 4 }}")
    
}
