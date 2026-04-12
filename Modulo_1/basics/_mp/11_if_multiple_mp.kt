fun main() {
    println("Controles de Flujo Ventas")
    println("Condicional if - Multiples condiciones")
    print("Capacidad de la bateria (mAh): ")
    val bateria = readLine()?.toIntOrNull()?:0

    val clasificacion = if(bateria<=2000){
        "Duracion muy baja"
    }else if(bateria<=3000){
        "Duracion normal"
    }else if(bateria<=4000){
        "Buena duracion"
    }else if(bateria<=5000){
        "Gran capacidad"
    }else if(bateria<=6000){
        "Bateria monstruosa"
    }else{
        "Powerbank integrada"
    }
    println("Clasificacion de bateria: ${clasificacion.uppercase()}")
}
