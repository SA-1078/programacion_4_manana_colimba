void main() {
  // Lambda asignada a una variable
  final calcularIva = (double precio) => precio * 0.19;
  print(calcularIva(999.99));  // 189.9981

  // Lambda de cuerpo completo
  final calcularPrecioFinal = (double precio, double descuento) {
    final montoDescuento = precio * (descuento / 100);
    return precio - montoDescuento;
  };
  print(calcularPrecioFinal(1299.99, 15.0));  // 1104.9915

  // Lambda en línea — pasada directamente como argumento
  final precios = [999.99, 299.99, 1299.99, 499.99, 149.99];
  precios.sort((a, b) => b.compareTo(a));  // orden descendente
  print(precios);  // [1299.99, 999.99, 499.99, 299.99, 149.99]
}
