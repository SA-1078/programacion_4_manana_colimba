// Bienvenida funcion sin parametro
void bienvenida() {
  print('Bienvenido a la Tienda Movil');
}

// Calcular precio base sin parametro
double precioBaseSinParametro() {
  return 999.99 + 49.99;
}


// Sintaxis completa — preferida para funciones públicas
double calcularTotal(double precio, double iva) {
  return precio + (precio * iva);
}

// Sintaxis de flecha — cuando el cuerpo es una sola expresión
double calcularDescuento(double precio, double porcentaje) => precio * (1 - porcentaje / 100);

// void — cuando no se devuelve nada
void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';


// El tercer parámetro es opcional — puede omitirse al llamar
String construirFicha(String marca, String modelo, [int? ram]) {
  if (ram != null) {
    return '$marca $modelo — ${ram}GB RAM';
  }
  return '$marca $modelo';
}

// Con valor por defecto — evita el chequeo de null
String construirFichaV2(String marca, String modelo, [int ram = 8]) {
  return '$marca $modelo — ${ram}GB RAM';
}

void main() {
  print(calcularTotal(999.99, 0.19));    // 1189.9881
  print(calcularDescuento(999.99, 10)); // 899.991
  imprimirSeparador('Catalogo');        // ─── Catalogo ───

  print(formatearPrecio(1299.99));         // $1299.99
  print(formatearPrecioSinTipo(699.99));   // $699.99

  print(construirFicha('Samsung', 'Galaxy S24'));          // Samsung Galaxy S24
  print(construirFicha('Apple', 'iPhone 15 Pro', 8));      // Apple iPhone 15 Pro — 8GB RAM
  print(construirFichaV2('Xiaomi', '14'));                  // Xiaomi 14 — 8GB RAM
}
