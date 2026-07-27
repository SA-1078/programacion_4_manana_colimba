import 'dart:io';

void main() {
  // Forma básica
  int temperatura = 38;

  if (temperatura > 37.5) {
    print('Fiebre');
  } else if (temperatura > 36) {
    print('Normal');
  } else {
    print('Hipotermia');
  }

  // Operador ternario — para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String estado = temperatura > 37.5 ? 'Con fiebre' : 'Sin fiebre';
  print(estado);

  // null-aware con ternario
  String? ciudad;
  String display = ciudad != null ? ciudad.toUpperCase() : 'Sin ciudad';

  // Forma más concisa con ??
  String display2 = ciudad?.toUpperCase() ?? 'Sin ciudad';
  print(display2); // Sin ciudad

  /*
  print("Ingrese un numero:");
  int num = int.parse(stdin.readLineSync()!);
  print("$num");

  if (num > 0) {
    print('El numero $num es positivo');
  } else if (num < 0) {
    print('El numero $num es negativo');
  } else {
    print('Es 0');
  }
  print("");
  print("");


  print("Ingrese la calificacion:");
  double nota = double.parse(stdin.readLineSync()!);
  print("La calificacion es:$nota");

  if (nota >= 7) {
    print('Aprovado');
  }
  else if (nota < 7) {
    print('Reprobado');
  }
  print("");
  print("");
*/
}
