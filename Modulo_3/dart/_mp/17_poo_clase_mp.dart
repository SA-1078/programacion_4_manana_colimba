class SmartphoneTienda {
  // 1. Propiedades
  final String imei;
  final String modelo;
  double       precio;
  bool         _disponible = true;  // _ indica uso interno

  // 2. Constructor nombrado con parámetros nombrados
  SmartphoneTienda({
    required this.imei,
    required this.modelo,
    required this.precio,
  });

  // 3. Getter — propiedad derivada, solo lectura
  bool   get disponible  => _disponible;
  String get estado      => _disponible ? 'disponible' : 'vendido';

  // 4. Setter — escritura controlada
  set estadoDisponible(bool valor) {
    _disponible = valor;
    print('$modelo: ${valor ? "puesto a la venta" : "marcado como vendido"}');
  }

  // 5. Métodos
  void vender() {
    _disponible = false;
    print('$modelo (IMEI: $imei) vendido a \$${precio.toStringAsFixed(2)}');
  }

  void aplicarDescuento(double porcentaje) {
    precio = precio * (1 - porcentaje / 100);
    print('$modelo con ${porcentaje}% de descuento. Nuevo precio: \$${precio.toStringAsFixed(2)}');
  }

  String resumen() => 'IMEI: $imei | Modelo: $modelo | Precio: \$${precio.toStringAsFixed(2)} | Estado: $estado';

  // 6. toString
  @override
  String toString() => 'SmartphoneTienda($modelo, \$${precio.toStringAsFixed(2)}, $estado)';
}

void main() {
  // Crear una instancia
  final galaxy = SmartphoneTienda(
    imei:   '356938035643809',
    modelo: 'Samsung Galaxy S24',
    precio: 999.99,
  );

  // Usar sus métodos y propiedades
  galaxy.aplicarDescuento(10);
  print(galaxy.estado);      // disponible
  print(galaxy.resumen());
  print(galaxy);             // llama toString() automáticamente

  galaxy.estadoDisponible = false;  // usa el setter
  print(galaxy.disponible);  // false
}
