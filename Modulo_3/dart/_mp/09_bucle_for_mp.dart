import 'dart:io';

void main() {
  /*
  // for con índice — cuando necesitas el número de iteración
  for (int i = 0; i < 5; i++) {
    print('Dispositivo #$i en revisión');
  }

  // for con paso distinto
  for (int i = 0; i <= 100; i += 25) {
    print('Progreso de inventario: $i%');
  }

  // for decreciente
  for (int i = 5; i >= 1; i--) {
    print('Conteo regresivo de unidades: $i');
  }
*/

  print("GENERAR CUOTAS MENSUALES - Ingrese el precio del dispositivo:");
  double precio = double.parse(stdin.readLineSync()!);
  for (int i = 1; i <= 12; i++) {
    print('Cuota $i de 12: \$${(precio / 12).toStringAsFixed(2)}');
  }
}
