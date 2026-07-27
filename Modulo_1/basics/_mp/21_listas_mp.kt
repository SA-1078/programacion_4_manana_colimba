fun main() {
    println("Listas-Inmutable")
    val marcas = listOf("Samsung", "Apple", "Xiaomi", "Apple", "Motorola")

    println("Size: ${marcas.size}")
    println("Mostrar el elemento indice 0: ${marcas[0]}")
    println("Mostrar el primer elemento: ${marcas.first()}")
    println("Mostrar el ultimo elemento: ${marcas.last()}")

    println("Mostrar el elemento indice 2: ${marcas.get(2)}")
    println("Mostrar indice contenido elemento: ${marcas.indexOf("Apple")}")
    println("Verificar existencia de elemento: ${marcas.contains("Xiaomi")}")
    println("Verificar existencia de un elemento: ${"Apple" in marcas}")

    // Sublista
    println("Sublista: ${marcas.subList(1, 3)}")
    println("Tomar los primeros 2 elementos: ${marcas.take(2)}")
    println("Suprimir tres primeros elementos: ${marcas.drop(3)}")
    println("Tomar los ultimos 2 elementos: ${marcas.takeLast(2)}")

    for (marca in marcas) {
        println(marca)
    }
    println("Listas-Mutable")
    val colores = mutableListOf("negro", "blanco", "azul", "dorado")
    println(colores)
    colores.add("rojo")
    println(colores)
    colores.add(0, "verde")
    println(colores)
    colores.remove("azul")
    println(colores)
    colores[1] = "titanio"
    println(colores)

    println("Array deque")
    val deque = ArrayDeque<Int>()
    println(deque)
    deque.addFirst(1)
    println(deque)
    deque.addLast(2)
    println(deque)
    deque.addLast(0)
    println(deque)
    deque.removeFirst()
    println(deque)
    deque.removeLast()
    println(deque)
}
