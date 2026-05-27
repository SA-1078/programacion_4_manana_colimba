double aplicarIva(double precio)       => precio * 1.19;
double aplicarDescuento(double precio) => precio * 0.90;

void main() {
  // La variable 'operacion' tiene tipo: double Function(double)
  double Function(double) operacion;

  operacion = aplicarIva;
  print(operacion(999.99));     // 1189.9881

  operacion = aplicarDescuento;
  print(operacion(999.99));     // 899.991

  // Lista de funciones
  final transformaciones = <double Function(double)>[aplicarIva, aplicarDescuento];
  for (final fn in transformaciones) {
    print(fn(500.0));           // 595.0, luego 450.0
  }
}
