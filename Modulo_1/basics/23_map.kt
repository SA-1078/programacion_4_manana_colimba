fun main () {
    println("Map inmutable")
    val capitales = mapOf(
        "Espana" to "Madrid", 
        "Francia" to "Paris", 
        "Alemania" to "Berlin",
        "Italia" to "Roma")
        
println(capitales["Espana"])
println(capitales["Portugal"])
println(capitales.getOrDefault("Portugal","Lisboa"))
println(capitales.getOrDefault("Portugal","Lisboa"))
}
