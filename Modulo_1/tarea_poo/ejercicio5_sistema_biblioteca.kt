/**
 * Ejercicio 5 — Mini sistema de biblioteca
 * Fundamentos de POO en Kotlin
 *
 * Sistema orientado a objetos para gestionar préstamos de libros.
 * Permite registrar, listar, prestar, devolver y buscar libros.
 * Aplica encapsulamiento y colecciones.
 */

// ──────────────── MODELO ────────────────

/**
 * Representa un libro en el sistema de biblioteca.
 * @param id     Identificador único del libro.
 * @param titulo Título del libro.
 * @param autor  Autor del libro.
 */
class LibroBiblioteca(
    val id: Int,
    val titulo: String,
    val autor: String
) {
    // Estado encapsulado — solo se modifica a través de métodos del sistema
    private var prestado: Boolean = false

    /** Indica si el libro está disponible para préstamo. */
    val estaDisponible: Boolean get() = !prestado

    /** Marca el libro como prestado (uso interno del sistema). */
    internal fun marcarComoPrestado() { prestado = true }

    /** Marca el libro como disponible (uso interno del sistema). */
    internal fun marcarComoDisponible() { prestado = false }

    /** Retorna el estado textual del libro. */
    fun estado(): String = if (prestado) "Prestado" else "Disponible"

    override fun toString() =
        "[ID: $id] \"$titulo\" — $autor | ${estado()}"
}

// ──────────────── SISTEMA DE BIBLIOTECA ────────────────

/**
 * Gestiona el catálogo de libros y las operaciones de préstamo.
 * El estado interno es privado — se accede solo a través de la API pública.
 */
object Biblioteca {
    private val libros = mutableListOf<LibroBiblioteca>()
    private var siguienteId = 1

    // ── REGISTRAR ──

    /**
     * Registra un nuevo libro en el sistema.
     * @param titulo Título del libro.
     * @param autor  Autor del libro.
     * @return El libro recién registrado.
     */
    fun registrarLibro(titulo: String, autor: String): LibroBiblioteca {
        val libro = LibroBiblioteca(siguienteId++, titulo, autor)
        libros.add(libro)
        println("Libro registrado: $libro")
        return libro
    }

    // ── LISTAR ──

    /** Lista todos los libros disponibles para préstamo. */
    fun listarDisponibles() {
        val disponibles = libros.filter { it.estaDisponible }
        println("\nLibros disponibles (${disponibles.size}):")
        if (disponibles.isEmpty()) {
            println("No hay libros disponibles en este momento.")
        } else {
            disponibles.forEach { println("  $it") }
        }
    }

    /** Lista todos los libros del catálogo (disponibles y prestados). */
    fun listarTodos() {
        println("\n Catálogo completo (${libros.size} libros):")
        if (libros.isEmpty()) {
            println(" El catálogo está vacío.")
        } else {
            libros.forEach { println("  $it") }
        }
    }

    // ── PRESTAR ──

    /**
     * Presta un libro por su ID.
     * Valida que el libro exista y esté disponible.
     * @param id ID del libro a prestar.
     * @return true si el préstamo fue exitoso.
     */
    fun prestarLibro(id: Int): Boolean {
        val libro = buscarPorId(id)
        if (libro == null) {
            println("No se encontró un libro con ID $id.")
            return false
        }
        if (!libro.estaDisponible) {
            println("\"${libro.titulo}\" ya está prestado. No se puede prestar nuevamente.")
            return false
        }
        libro.marcarComoPrestado()
        println("Préstamo exitoso: \"${libro.titulo}\" ha sido prestado.")
        return true
    }

    // ── DEVOLVER ──

    /**
     * Registra la devolución de un libro por su ID.
     * Valida que el libro exista y esté realmente prestado.
     * @param id ID del libro a devolver.
     * @return true si la devolución fue exitosa.
     */
    fun devolverLibro(id: Int): Boolean {
        val libro = buscarPorId(id)
        if (libro == null) {
            println("No se encontró un libro con ID $id.")
            return false
        }
        if (libro.estaDisponible) {
            println("\"${libro.titulo}\" no está prestado. No se puede devolver.")
            return false
        }
        libro.marcarComoDisponible()
        println("Devolución exitosa: \"${libro.titulo}\" está disponible nuevamente.")
        return true
    }

    // ── BUSCAR ──

    /**
     * Busca libros cuyo título contenga la consulta (sin distinguir mayúsculas).
     * @param query Texto a buscar en el título.
     */
    fun buscarPorTitulo(query: String) {
        val resultados = libros.filter { it.titulo.contains(query, ignoreCase = true) }
        println("\n Búsqueda por título: \"$query\" — ${resultados.size} resultado(s):")
        if (resultados.isEmpty()) {
            println("No se encontraron libros con ese título.")
        } else {
            resultados.forEach { println("  $it") }
        }
    }

    // ── PRIVADO ──

    private fun buscarPorId(id: Int): LibroBiblioteca? = libros.find { it.id == id }
}

// ──────────────── MAIN ────────────────

fun main() {
    println("╔══════════════════════════════════════════╗")
    println("║  EJERCICIO 5: Mini Sistema de Biblioteca  ║")
    println("╚══════════════════════════════════════════╝\n")

    // ── 1. Registrar libros
    println("--- Registrando libros ---")
    Biblioteca.registrarLibro("Cien años de soledad", "Gabriel García Márquez")
    Biblioteca.registrarLibro("Clean Code", "Robert C. Martin")
    Biblioteca.registrarLibro("El Principito", "Antoine de Saint-Exupéry")
    Biblioteca.registrarLibro("Don Quijote de la Mancha", "Miguel de Cervantes")
    Biblioteca.registrarLibro("Harry Potter y la piedra filosofal", "J.K. Rowling")

    // ── 2. Listar disponibles
    Biblioteca.listarDisponibles()

    // ── 3. Prestar libros
    println("\n--- Operaciones de préstamo ---")
    Biblioteca.prestarLibro(1)   // exitoso
    Biblioteca.prestarLibro(3)   // exitoso
    Biblioteca.prestarLibro(1)   // ya prestado — debe fallar
    Biblioteca.prestarLibro(99)  // ID no existe — debe fallar

    // ── 4. Ver catálogo actualizado
    Biblioteca.listarTodos()

    // ── 5. Devolver libro
    println("\n--- Operaciones de devolución ---")
    Biblioteca.devolverLibro(3)   // exitoso
    Biblioteca.devolverLibro(3)   // ya disponible — debe fallar
    Biblioteca.devolverLibro(2)   // no estaba prestado — debe fallar

    // ── 6. Buscar por título
    println()
    Biblioteca.buscarPorTitulo("clean")
    Biblioteca.buscarPorTitulo("harry")
    Biblioteca.buscarPorTitulo("xyz")   // sin resultados

    // ── 7. Estado final
    Biblioteca.listarTodos()
    Biblioteca.listarDisponibles()
}
