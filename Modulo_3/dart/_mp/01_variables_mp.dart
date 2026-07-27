void main() {
  // var — tipo inferido (como val en Kotlin)
  var marca = 'Samsung'; // String
  var stock = 15; // int
  var precio = 999.99; // double
  var disponible = true; // bool

  // Tipo explícito
  String modelo = 'Galaxy S24';
  int garantiaMeses = 12;
  double descuento = 0.10;
  bool esGamaAlta = true;

  // final — no se puede reasignar (como val en Kotlin)
  final imei = '356938035643809';
  // imei = '000000000000000';  // ERROR — final no se puede reasignar

  // const — constante en tiempo de compilación (como const en Kotlin)
  const ivaColombiano = 0.19;
  const nombreTienda = 'TechMobile Store';

  // Diferencia clave: final vs const
  final fechaVenta = DateTime.now(); // OK — se evalúa en runtime
  // const fechaVenta = DateTime.now(); // ERROR — DateTime.now() no es constante de compilación

  print('$marca $modelo — \$${precio.toStringAsFixed(2)} | Stock: $stock unidades | IMEI: $imei');
}
