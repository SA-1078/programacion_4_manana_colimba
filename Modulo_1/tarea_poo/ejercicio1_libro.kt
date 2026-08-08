/**
 * Ejercicio 1 — Clase Libro
 * Fundamentos de POO en Kotlin
 *
 * Se crea la clase Libro con sus atributos y métodos para mostrar
 * información y determinar si el libro es antiguo o reciente.
 */

class Libro(
    val titulo: String,
    val autor: String,
    val anioPublicacion: Int,
    val numeroPaginas: Int
) {
    /**
     * Muestra la información completa del libro.
     */
    fun mostrarInformacion() {
        println("==============================")
        println("Título            : $titulo")
        println("Autor             : $autor")
        println("Año de publicacion: $anioPublicacion")
        println("Número de páginas : $numeroPaginas")
        println("Clasificacion     : ${clasificacion()}")
        println("==============================")
    }

    /**
     * Determina si el libro es antiguo (antes del año 2000) o reciente.
     * @return true si fue publicado antes del año 2000
     */
    fun esAntiguo(): Boolean = anioPublicacion < 2000

    /**
     * Retorna la clasificación textual del libro.
     */
    private fun clasificacion(): String =
        if (esAntiguo()) "📚 Libro antiguo (antes del 2000)" else "📖 Libro reciente (2000 en adelante)"
}

fun main() {
    println("EJERCICIO 1: Clase Libro")

    // Crear objetos de tipo Libro
    val libro1 = Libro(
        titulo = "Cien años de soledad",
        autor = "Gabriel García Márquez",
        anioPublicacion = 1967,
        numeroPaginas = 432
    )

    val libro2 = Libro(
        titulo = "El Juego del Ángel",
        autor = "Carlos Ruiz Zafón",
        anioPublicacion = 2008,
        numeroPaginas = 566
    )

    val libro3 = Libro(
        titulo = "Clean Code",
        autor = "Robert C. Martin",
        anioPublicacion = 2008,
        numeroPaginas = 431
    )

    val libro4 = Libro(
        titulo = "Don Quijote de la Mancha",
        autor = "Miguel de Cervantes",
        anioPublicacion = 1605,
        numeroPaginas = 863
    )

    // Mostrar información de cada libro
    val libros = listOf(libro1, libro2, libro3, libro4)
    libros.forEach { it.mostrarInformacion() }

    println("\n=== Resumen de clasificacion ===")
    libros.forEach { libro ->
        val estado = if (libro.esAntiguo()) "ANTIGUO" else "RECIENTE"
        println("\"${libro.titulo}\" (${libro.anioPublicacion}) → $estado")
    }
}
