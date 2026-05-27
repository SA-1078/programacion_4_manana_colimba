// abstract class define el contrato — QUÉ puede hacer cualquier DispositivoMovil
abstract class DispositivoMovil {
  String get nombre;
  double calcularPrecioConIva();    // cada dispositivo lo implementa a su manera
  double calcularPrecioDescuento();

  // Método concreto construido sobre la abstracción
  void mostrarFicha() {
    print('$nombre — precio con IVA: \$${calcularPrecioConIva().toStringAsFixed(2)}, '
          'con descuento: \$${calcularPrecioDescuento().toStringAsFixed(2)}');
  }
}

// Implementaciones concretas — el CÓMO es específico de cada clase
class Smartphone extends DispositivoMovil {
  final double precio;
  final String marca;
  Smartphone(this.marca, this.precio);

  @override String get nombre              => 'Smartphone $marca (\$${precio.toStringAsFixed(2)})';
  @override double calcularPrecioConIva()  => precio * 1.19;
  @override double calcularPrecioDescuento() => precio * 0.90;
}

class Tablet extends DispositivoMovil {
  final double precio;
  final String marca;
  Tablet(this.marca, this.precio);

  @override String get nombre              => 'Tablet $marca (\$${precio.toStringAsFixed(2)})';
  @override double calcularPrecioConIva()  => precio * 1.19;
  @override double calcularPrecioDescuento() => precio * 0.85; // mayor descuento en tablets
}

void main() {
  final dispositivos = <DispositivoMovil>[
    Smartphone('Samsung Galaxy S24', 999.99),
    Tablet('iPad Air', 749.99),
  ];
  for (final d in dispositivos) {
    d.mostrarFicha();  // no importa qué tipo de DispositivoMovil es
  }
}
