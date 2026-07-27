/**
 * Ejercicio 3 — Herencia con vehículos
 * Fundamentos de POO en Kotlin
 *
 * Se define una clase base Vehiculo y las clases hijas Auto y Motocicleta,
 * cada una con atributo propio y sobrescritura del método mostrarDatos().
 */

// ──────────────── CLASE BASE ────────────────

/**
 * Clase base que representa un vehículo genérico.
 * @param marca  Marca del vehículo.
 * @param modelo Modelo del vehículo.
 * @param anio   Año de fabricación.
 */
open class Vehiculo(
    val marca: String,
    val modelo: String,
    val anio: Int
) {
    /**
     * Muestra los datos generales del vehículo.
     * Puede ser sobrescrita por las clases hijas.
     */
    open fun mostrarDatos() {
        println("  Marca  : $marca")
        println("  Modelo : $modelo")
        println("  Año    : $anio")
    }
}

// ──────────────── CLASES HIJAS ────────────────

/**
 * Representa un automóvil. Hereda de Vehiculo.
 * Atributo propio: número de puertas.
 */
class Auto(
    marca: String,
    modelo: String,
    anio: Int,
    val numeroPuertas: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("AUTO")
        super.mostrarDatos()
        println("  Puertas: $numeroPuertas")
    }
}

/**
 * Representa una motocicleta. Hereda de Vehiculo.
 * Atributos propios: tipo de manubrio y cilindrada.
 */
class Motocicleta(
    marca: String,
    modelo: String,
    anio: Int,
    val tipoManubrio: String,
    val cilindrada: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("MOTOCICLETA")
        super.mostrarDatos()
        println("  Manubrio  : $tipoManubrio")
        println("  Cilindrada: ${cilindrada}cc")
    }
}

fun main() {
    println("=== EJERCICIO 3: Herencia con Vehículos ===\n")

    // Crear objetos de cada tipo
    val auto1 = Auto(
        marca = "Toyota",
        modelo = "Corolla",
        anio = 2022,
        numeroPuertas = 4
    )

    val auto2 = Auto(
        marca = "Chevrolet",
        modelo = "Spark",
        anio = 2020,
        numeroPuertas = 2
    )

    val moto1 = Motocicleta(
        marca = "Honda",
        modelo = "CB500F",
        anio = 2023,
        tipoManubrio = "Semi-bajo deportivo",
        cilindrada = 500
    )

    val moto2 = Motocicleta(
        marca = "Yamaha",
        modelo = "MT-07",
        anio = 2021,
        tipoManubrio = "Naked alto",
        cilindrada = 689
    )

    // Recorrer lista polimórfica de vehículos
    val vehiculos: List<Vehiculo> = listOf(auto1, auto2, moto1, moto2)

    vehiculos.forEach { vehiculo ->
        println("──────────────────────────")
        vehiculo.mostrarDatos()
    }
    println("──────────────────────────")

    println("\n=== Resumen de flota ===")
    val autos = vehiculos.filterIsInstance<Auto>()
    val motos = vehiculos.filterIsInstance<Motocicleta>()
    println("Total autos       : ${autos.size}")
    println("Total motocicletas: ${motos.size}")
}
