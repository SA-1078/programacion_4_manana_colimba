fun main() {
    while (true) {
        println("MENU TIENDA MOVILES")
        println("1. Consultar dispositivo")
        println("2. Calcular precio con IVA")
        println("3. Ver marcas disponibles")
        println("4. Salir")
        print("Selecciona una opcion (1-4): ")

        val opcion = readLine()?.toIntOrNull()

        when (opcion) {
            1 -> {
                println("Ingresa el nombre del dispositivo:")
                val dispositivo = readLine() ?: "Desconocido"
                println("Consultando disponibilidad de: $dispositivo")
            }

            2 -> {
                println("Calcular precio con IVA")
            }

            3 -> {
                println("Marcas disponibles")
            }

            4 -> {
                println("Saliendo de la tienda...")
                break
            }

            else -> {
                println("Opcion no valida.")
            }
        }
    }
}
