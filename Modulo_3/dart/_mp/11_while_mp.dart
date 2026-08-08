import 'dart:io';

/*
void main() {
  // while — comprueba la condición ANTES de ejecutar
  int unidades = 0;
  int stock = 1024; // unidades disponibles

  while (stock > 0) {
    final lote = stock > 256 ? 256 : stock;
    unidades++;
    stock -= lote;
    print('Lote $unidades: $lote unidades (restante: $stock)');
  }

  // do-while — ejecuta AL MENOS UNA VEZ antes de comprobar
  int reintentos = 0;
  bool pagoAprobado = false;

  do {
    reintentos++;
    print('Intento de cobro #$reintentos...');
    // Simular que el pago es aprobado en el 3er intento
    if (reintentos == 3) pagoAprobado = true;
  } while (!pagoAprobado && reintentos < 5);

  print(
    pagoAprobado
        ? 'Pago aprobado tras $reintentos intentos'
        : 'No se pudo procesar el pago',
  );
}
*/

void main() {
  int totalDispositivos = 0;
  int totalVendedores = 0;

  print('Registro de ventas de la tienda movil');
  print('');

  while (true) {
    stdout.write('Ingrese las horas trabajadas: ');
    String? inputHoras = stdin.readLineSync();
    if (inputHoras == null) break;
    double? horas = double.tryParse(inputHoras);
    if (horas == null) {
      print('Número inválido.');
      continue;
    }
    if (horas <= 0) {
      break;
    }

    stdout.write('Ingrese la cantidad de dispositivos vendidos: ');
    String? inputDispositivos = stdin.readLineSync();
    if (inputDispositivos == null) break;
    int? dispositivos = int.tryParse(inputDispositivos);
    if (dispositivos == null) {
      print('Cantidad de dispositivos inválida.');
      continue;
    }

    double dispositivosPorHora = dispositivos / horas;
    String clasificacion;
    if (dispositivosPorHora < 2) {
      clasificacion = 'Ventas bajas';
    } else if (dispositivosPorHora <= 5) {
      clasificacion = 'Ventas normales';
    } else {
      clasificacion = 'Ventas altas';
    }

    print('Dispositivos vendidos por hora: ${dispositivosPorHora.toStringAsFixed(2)} - $clasificacion');

    totalDispositivos += dispositivos;
    totalVendedores++;
  }

  print('');
  print('Resumen de Ventas');
  print('Total de dispositivos vendidos: $totalDispositivos');
  print('Cantidad de vendedores registrados: $totalVendedores');

  if (totalVendedores > 0) {
    double promedio = totalDispositivos / totalVendedores;
    print('Promedio de dispositivos por vendedor: ${promedio.toStringAsFixed(2)}');
  } else {
    print('Promedio de dispositivos por vendedor: 0.00');
  }
}
