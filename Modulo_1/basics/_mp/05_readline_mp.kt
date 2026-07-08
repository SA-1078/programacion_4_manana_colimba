fun main() {
    
    //readline
    println("Escribe el nombre del cliente : ")
	val cliente=readLine()
    println("Cliente ingresado : $cliente")
    
    println("Escribe la marca del equipo : ")
	val marca=readLine() ?: "genérica"
    println("Marca ingresada : $marca")

}
