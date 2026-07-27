import 'dart:io';

void main() {
  /*
  // for con índice — cuando necesitas el número de iteración
  for (int i = 0; i < 5; i++) {
    print('Iteración $i');
  }

  // for con paso distinto
  for (int i = 0; i <= 100; i += 25) {
    print('Progreso: $i%');
  }

  // for decreciente
  for (int i = 5; i >= 1; i--) {
    print('Cuenta regresiva: $i');
  }
*/

  print("TABLA DE MULTIPLICACION A IMPRIMIR:");
  int num = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= 10; i++) {
    print('$num * $i = ${num * i}');
  }
}