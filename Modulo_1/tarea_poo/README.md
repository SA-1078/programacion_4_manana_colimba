# Tarea — Fundamentos de Programación Orientada a Objetos en Kotlin

**Apertura:** domingo, 24 de mayo de 2026  
**Cierre:** domingo, 31 de mayo de 2026, 23:59

---

## Objetivo

Aplicar los fundamentos de la Programación Orientada a Objetos (POO) en Kotlin mediante ejercicios prácticos sobre clases, objetos, atributos, métodos, encapsulamiento, herencia y polimorfismo.

---

## Estructura de archivos

```
tarea_poo/
├── ejercicio1_libro.kt                  → Clase Libro
├── ejercicio2_producto_inventario.kt    → Encapsulamiento con ProductoInventario
├── ejercicio3_herencia_vehiculos.kt     → Herencia con Vehículos
├── ejercicio4_polimorfismo_pago.kt      → Polimorfismo con Métodos de Pago
├── ejercicio5_sistema_biblioteca.kt     → Mini Sistema de Biblioteca
└── README.md                            → Este archivo
```

---

## Ejercicio 1 — Clase Libro

**Archivo:** `ejercicio1_libro.kt`

### Descripción
Se define la clase `Libro` con cuatro atributos: `titulo`, `autor`, `anioPublicacion` y `numeroPaginas`. Incluye dos métodos públicos:

- `mostrarInformacion()` — imprime todos los datos del libro en formato legible.
- `esAntiguo()` — retorna `true` si el libro fue publicado **antes del año 2000**.

### Objetos creados
| Título | Autor | Año | Páginas | Clasificación |
|---|---|---|---|---|
| Cien años de soledad | García Márquez | 1967 | 432 | Antiguo |
| El Juego del Ángel | Ruiz Zafón | 2008 | 566 | Reciente |
| Clean Code | Robert C. Martin | 2008 | 431 | Reciente |
| Don Quijote de la Mancha | Cervantes | 1605 | 863 | Antiguo |

---

## Ejercicio 2 — Encapsulamiento con ProductoInventario

**Archivo:** `ejercicio2_producto_inventario.kt`

### Descripción
La clase `ProductoInventario` expone `codigo` y `nombre` como públicos, pero **encapsula `precio` y `stock`** como privados (`private var`). El acceso se hace solo a través de métodos controlados:

| Método | Función |
|---|---|
| `consultarPrecio()` | Retorna el precio actual |
| `consultarStock()` | Retorna el stock actual |
| `aumentarStock(n)` | Suma `n` al stock (valida que `n > 0`) |
| `disminuirStock(n)` | Resta `n` del stock (valida que no quede negativo) |
| `cambiarPrecio(p)` | Actualiza precio (valida que no sea negativo) |

### Encapsulamiento aplicado
- `precio` y `stock` son `private var` — no pueden leerse ni modificarse directamente desde fuera de la clase.
- Cada operación incluye validación antes de modificar el estado interno.

---

## Ejercicio 3 — Herencia con Vehículos

**Archivo:** `ejercicio3_herencia_vehiculos.kt`

### Descripción
Se define la clase base `Vehiculo` marcada como `open` con los atributos comunes (`marca`, `modelo`, `anio`) y el método `open fun mostrarDatos()`.

Las clases hijas:
- **`Auto`** → agrega `numeroPuertas` y sobrescribe `mostrarDatos()`.
- **`Motocicleta`** → agrega `tipoManubrio` y `cilindrada`, sobrescribe `mostrarDatos()`.

### Herencia aplicada
- La palabra clave `open` permite que una clase y sus métodos sean heredables.
- `override` indica que la subclase redefine el comportamiento del método padre.
- Se llama a `super.mostrarDatos()` para reutilizar la lógica de la clase base.

---

## Ejercicio 4 — Polimorfismo con Métodos de Pago

**Archivo:** `ejercicio4_polimorfismo_pago.kt`

### Descripción
Se define la interfaz `MetodoPago` con el método abstracto `procesarPago(monto: Double)`. Tres clases la implementan de forma independiente:

| Clase | Comportamiento |
|---|---|
| `PagoEfectivo` | Informa que se recibe el efectivo en caja |
| `PagoTarjeta` | Realiza el cobro a la tarjeta indicada |
| `PagoTransferencia` | Envía el monto a la cuenta bancaria destino |

### Polimorfismo aplicado
La función `realizarCobro(monto, metodo)` recibe cualquier objeto `MetodoPago` y llama a `procesarPago()` sin saber qué tipo concreto es. Cada clase responde de forma diferente a la misma llamada.

---

## Ejercicio 5 — Mini Sistema de Biblioteca

**Archivo:** `ejercicio5_sistema_biblioteca.kt`

### Descripción
Sistema completo con el objeto singleton `Biblioteca` que gestiona un catálogo de libros representados por la clase `LibroBiblioteca`.

### Operaciones disponibles
| Operación | Método | Validación |
|---|---|---|
| Registrar libro | `registrarLibro(titulo, autor)` | — |
| Listar disponibles | `listarDisponibles()` | Solo muestra los disponibles |
| Listar todos | `listarTodos()` | Muestra estado de cada libro |
| Prestar libro | `prestarLibro(id)` | Falla si ya está prestado o ID no existe |
| Devolver libro | `devolverLibro(id)` | Falla si no está prestado o ID no existe |
| Buscar por título | `buscarPorTitulo(query)` | Búsqueda parcial, sin distinción de mayúsculas |

### Encapsulamiento
- El atributo `prestado` de `LibroBiblioteca` es **private** — solo se modifica a través de `marcarComoPrestado()` y `marcarComoDisponible()`.
- La lista interna de `Biblioteca` es **private** — nadie puede modificarla directamente.

---

## Cómo ejecutar

Cada archivo contiene una función `main()` independiente. Puedes ejecutar cualquiera de ellos directamente desde IntelliJ IDEA o con el compilador de Kotlin:

```bash
kotlinc ejercicio1_libro.kt -include-runtime -d ejercicio1.jar
java -jar ejercicio1.jar
```
