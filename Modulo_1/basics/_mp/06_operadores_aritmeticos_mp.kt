fun main() {
    
    //readline
    println("Operadores Aritmeticos en Ventas")
	println("Escribe precio del equipo 1 : ")
	val precio1 = readLine()?.toInt() ?: 0


    println("Escribe precio del equipo 2 : ")
	val precio2 = readLine()?.toInt() ?: 0

    println("Suma de precios")
    println("$precio1 + $precio2 : ${precio1+precio2}")
    println("Diferencia de precio")
    println("$precio1 - $precio2 : ${precio1-precio2}")
    println("Multiplicacion (comprar varios)")
    println("$precio1 * $precio2 : ${precio1*precio2}")
    println("Division de costo")
    println("$precio1 / $precio2 : ${precio1/precio2}")
    println("Modulo")
    println("$precio1 % $precio2 : ${precio1%precio2}")
    
    println("Operadores de Asignacion Compuesta (Stock)")
    var stock=10
    
    stock+=5
    println("stock+=5 $stock")
    stock-=3
    println("stock-=3 $stock")
    stock*=6
    println("stock*=5 $stock")
    stock/=2
    println("stock/=5 $stock")
    stock%=2
    println("stock%=2 $stock")
    
    //Incremento o Decremento
    stock++
    println("stock++ $stock")
    stock--
    println("stock-- $stock")
    
}
