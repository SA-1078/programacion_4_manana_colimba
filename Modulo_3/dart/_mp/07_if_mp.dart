import 'dart:io';

void main() {
  // Forma básica
  double precio = 999.99;

  if (precio >= 1000) {
    print('Gama Premium');
  } else if (precio >= 500) {
    print('Gama Alta');
  } else if (precio >= 200) {
    print('Gama Media');
  } else {
    print('Gama Baja');
  }

  // Operador ternario — para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String categoria = precio >= 800 ? 'Gama alta' : 'Gama media o baja';
  print(categoria);

  // null-aware con ternario
  String? colorDisponible;
  String display = 'Sin color especificado';

  // Forma más concisa con ??
  String display2 = colorDisponible?.toUpperCase() ?? 'Sin color especificado';
  print(display2); // Sin color especificado

  /*
  print("Ingrese el precio del dispositivo:");
  double precioIngresado = double.parse(stdin.readLineSync()!);
  print("$precioIngresado");

  if (precioIngresado > 0) {
    print('El precio \$$precioIngresado es válido');
  } else if (precioIngresado < 0) {
    print('El precio \$$precioIngresado es negativo');
  } else {
    print('El precio es 0');
  }
  print("");
  print("");


  print("Ingrese el stock disponible:");
  int stock = int.parse(stdin.readLineSync()!);
  print("El stock es: $stock unidades");

  if (stock >= 10) {
    print('Stock suficiente');
  }
  else if (stock < 10) {
    print('Stock bajo - solicitar reabastecimiento');
  }
  print("");
  print("");
*/
}
