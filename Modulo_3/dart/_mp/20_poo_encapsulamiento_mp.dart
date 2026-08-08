class CarritoCompra {
  final String cliente;
  double _saldo;  // privado — nadie lo modifica directamente

  CarritoCompra(this.cliente, double saldoInicial)
      : _saldo = saldoInicial;

  // Getter — lectura permitida, escritura no
  double get saldo => _saldo;

  // Los únicos caminos para modificar _saldo
  void agregarFondos(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    _saldo += monto;
    print('Fondos agregados: \$$monto. Saldo actual: \$$_saldo');
  }

  void realizarCompra(double monto) {
    if (monto <= 0)     throw ArgumentError('El monto debe ser positivo');
    if (monto > _saldo) throw StateError('Saldo insuficiente para la compra');
    _saldo -= monto;
    print('Compra realizada: \$$monto. Saldo restante: \$$_saldo');
  }
}

void main() {
  final carrito = CarritoCompra('Carlos Ruiz', 1500.0);

  carrito.agregarFondos(500.0);   // Fondos agregados: $500.0. Saldo actual: $2000.0
  carrito.realizarCompra(999.99); // Compra realizada: $999.99. Saldo restante: $1000.01
  print(carrito.saldo);           // 1000.01

  // carrito._saldo = 999999;  // ERROR — privado, Dart no lo permite
}
