fun main() {
    val marca="Xiaomi"
    val modelo="Redmi Note 12"
    val precio=250
    
    //variable simple
    println("Venta de $marca")
    
    //Expresion
    println("Equipo Completo : ${marca.uppercase()} ${modelo.uppercase()}")
    val equipoCompleto="Equipo Completo : ${marca.uppercase()} ${modelo.uppercase()}"
    println(equipoCompleto)
    println("Precio final con funda : ${precio+15}")
    
    //String Multilinea
    val ticket="""
    	|Equipo: $marca $modelo
        |Precio Original: $precio
        |Descuento: ${if(precio>=200)"Aplicado" else "No Aplicado"}
    
    """.trimMargin()
    
    println(ticket)
    
}
