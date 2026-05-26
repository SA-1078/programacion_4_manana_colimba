import 'dart:io';

void main() {
  /*
  print("Ingrese el nombre del dispositivo:");
  String? dispositivo = stdin.readLineSync();
  print("Buscando: $dispositivo");

  print("Ingrese el stock disponible:");
  int stock = int.parse(stdin.readLineSync()!);
  print("Stock: $stock unidades");

  print("Ingrese el precio:");
  double precio = double.parse(stdin.readLineSync()!);
  print("Precio: \$$precio");

  print("");
  print("CALCULO DE TOTAL CON IVA");
  print('Ingrese el precio base:');
  double base = double.parse(stdin.readLineSync()!);

  print('Ingrese el porcentaje de IVA:');
  double iva = double.parse(stdin.readLineSync()!);

  double total = base + (base * iva / 100);

  print('Total con IVA: \$${total.toStringAsFixed(2)}');
*/

  print("Ingrese el precio del dispositivo:");
  double precio = double.parse(stdin.readLineSync()!);
  print("El precio es: \$$precio");

  if (precio > 0) {
    print('precio valido');
  } else if (precio < 0) {
    print('precio invalido');
  } else {
    print('precio en cero');
  }
}
