// Clase abstracta base para tipos de dispositivos de la tienda
abstract class ProductoTienda {
  String get nombre;
  double calcularPrecioFinal();
}

class SmartphonePoli extends ProductoTienda {
  final double precio;
  final String marca;
  SmartphonePoli(this.marca, this.precio);
  @override String get nombre              => 'Smartphone $marca';
  @override double calcularPrecioFinal()   => precio * 1.19; // con IVA
}

class TabletPoli extends ProductoTienda {
  final double precio;
  final String marca;
  TabletPoli(this.marca, this.precio);
  @override String get nombre              => 'Tablet $marca';
  @override double calcularPrecioFinal()   => precio * 1.19 * 0.95; // IVA + 5% descuento
}

class AccesorioPoli extends ProductoTienda {
  final double precio;
  final String tipo;
  AccesorioPoli(this.tipo, this.precio);
  @override String get nombre              => 'Accesorio: $tipo';
  @override double calcularPrecioFinal()   => precio; // sin IVA adicional
}

// POLIMORFISMO: una sola función trabaja con cualquier ProductoTienda
void imprimirPrecioFinal(ProductoTienda producto) {
  print('${producto.nombre}: \$${producto.calcularPrecioFinal().toStringAsFixed(2)}');
}

void main() {
  final catalogo = <ProductoTienda>[
    SmartphonePoli('Samsung Galaxy S24', 999.99),
    TabletPoli('iPad Air', 749.99),
    AccesorioPoli('Funda protectora', 29.99),
  ];

  // Misma llamada — comportamiento diferente según el tipo real
  for (final p in catalogo) {
    imprimirPrecioFinal(p);
  }

  // Producto más caro — POLIMORFISMO con reduce
  final maCaro = catalogo.reduce((a, b) =>
      a.calcularPrecioFinal() > b.calcularPrecioFinal() ? a : b);
  print('\nProducto más caro: ${maCaro.nombre}');
}
