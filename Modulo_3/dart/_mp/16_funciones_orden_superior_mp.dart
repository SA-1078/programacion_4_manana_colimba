void main() {
  final precios = [299.99, 999.99, 149.99, 1299.99];

  // map devuelve un Iterable con cada elemento transformado
  final preciosConIva = precios.map((p) => p * 1.19);
  print(preciosConIva.toList());
  // [356.9881, 1189.9881, 178.4881, 1546.9881]

  // map sobre Strings
  final modelos = ['Galaxy S24', 'iPhone 15 Pro', 'Xiaomi 14'];
  final fichas  = modelos.map((m) => 'Disponible: $m');
  print(fichas.toList());
  // [Disponible: Galaxy S24, ...]

  void main() {
  final preciosCatalogo = [149.99, 499.99, 999.99, 299.99, 1299.99, 89.99];

  final gamaAlta    = preciosCatalogo.where((p) => p > 700);
  print(gamaAlta.toList());   // [999.99, 1299.99]

  final gamaMedia   = preciosCatalogo.where((p) => p >= 200 && p <= 700);
  print(gamaMedia.toList());  // [499.99, 299.99]
  }
  final ventas = [1500.0, 2300.0, 980.0, 3100.0, 750.0];

  // reduce — combina todos los elementos en uno
  final totalVentas = ventas.reduce((acum, venta) => acum + venta);
  print('Total ventas: \$${totalVentas.toStringAsFixed(2)}');  // Total ventas: $8630.00

  // fold — como reduce pero con valor inicial (más seguro con listas vacías)
  final totalFold = ventas.fold(0.0, (acum, venta) => acum + venta);
  print('Total (fold): \$${totalFold.toStringAsFixed(2)}');

  // Encontrar la venta más alta
  final mayorVenta = ventas.reduce((a, b) => a > b ? a : b);
  print('Mayor venta: \$$mayorVenta');  // Mayor venta: $3100.0
}
