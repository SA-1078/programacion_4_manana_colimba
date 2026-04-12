fun main() {
    println("Tipos de Datos en Tienda Movil")
    println("Numeros Enteros")
    val cantidadAccesorios: Byte=127
    println("Numero byte $cantidadAccesorios")
    val cantidadEquipos: Short=32_765
    println("Numero short $cantidadEquipos")
    val ventasDiarias: Int=12
    println("Numero int $ventasDiarias")
    val idTransaccion: Long=12_122_122_122_123_123L
    println("Numero long $idTransaccion")
    val grosorCelular: Float=7.4f
    println("Numero float $grosorCelular")
    val precioEquipo: Double=899.991234
    println("Numero double $precioEquipo")
    
    
    //Inferido
    val marca="Apple"
    val bateria=4000
    
    println("Marca $marca")
    val marcaTipo=marca::class.simpleName
    println("Tipo inferido : ${marca::class.simpleName}")
    println("Tipo inferido : $marcaTipo")
    
    println("Bateria $bateria")
    val bateriaTipo=bateria::class.simpleName
    println("Tipo bateria : ${bateria::class.simpleName}")
    println("Tipo inferido : $bateriaTipo")
    
}
