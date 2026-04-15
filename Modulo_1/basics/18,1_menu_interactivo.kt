fun main() {
    while (true) {
        println("MENU")
        println("1. Saludar")
        println("2. Sumar")
        println("3. Tabla de multiplicar")
        println("4. Salir")
        print("Selecciona una opcion (1-4): ")

        val opcion = readLine()?.toIntOrNull()

        when (opcion) {
            1 -> {
                println("Ingresa tu nombre:")
                val nombre = readLine()?:"Invitado"
                println("Hola, $nombre")
            }

            2 -> {
                println("Sumar")
            }

            3 -> {
                println("Tabla")
            }

            4 -> {
                println("Saliendo del programa...")
                break
            }

            else -> {
                println("Opcion no valida.")
            }
        }
    }
}
