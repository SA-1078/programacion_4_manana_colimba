import 'dart:io';

/*
void main() {
  // while — comprueba la condición ANTES de ejecutar
  int paquetes = 0;
  int buffer = 1024; // bytes disponibles

  while (buffer > 0) {
    final tamano = buffer > 256 ? 256 : buffer;
    paquetes++;
    buffer -= tamano;
    print('Paquete $paquetes: $tamano bytes (restante: $buffer)');
  }

  // do-while — ejecuta AL MENOS UNA VEZ antes de comprobar
  int reintentos = 0;
  bool conexionEstablecida = false;

  do {
    reintentos++;
    print('Intento de conexión #$reintentos...');
    // Simular que conecta en el 3er intento
    if (reintentos == 3) conexionEstablecida = true;
  } while (!conexionEstablecida && reintentos < 5);

  print(
    conexionEstablecida
        ? 'Conectado tras $reintentos intentos'
        : 'No se pudo conectar',
  );
}








void main() {
  int totalSillas = 0;
  int totalEmpleados = 0;

  print('Registro de producción de la carpintería');
  print("");

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

    stdout.write('Ingrese la cantidad de sillas fabricadas: ');
    String? inputSillas = stdin.readLineSync();
    if (inputSillas == null) break;
    int? sillas = int.tryParse(inputSillas);
    if (sillas == null) {
      print('Cantidad de sillas inválida.');
      continue;
    }

    double sillasPorHora = sillas / horas;
    String clasificacion;
    if (sillasPorHora < 2) {
      clasificacion = 'Producción baja';
    } else if (sillasPorHora <= 4) {
      clasificacion = 'Producción normal';
    } else {
      clasificacion = 'Producción alta';
    }

    print('Sillas fabricadas por hora: ${sillasPorHora.toStringAsFixed(2)} - $clasificacion');

    totalSillas += sillas;
    totalEmpleados++;
  }

  print("");
  print('Resumen de Producción');
  print('Total de sillas fabricadas: $totalSillas');
  print('Cantidad de empleados registrados: $totalEmpleados');

  if (totalEmpleados > 0) {
    double promedio = totalSillas / totalEmpleados;
    print('Promedio de sillas por empleado: ${promedio.toStringAsFixed(2)}');
  } else {
    print('Promedio de sillas por empleado: 0.00');
  }
}
*/

void main() {
  int totalPacientes = 0;
  int totalDoctores = 0;

  print('Consultorio Medico:');
  print("");

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

    stdout.write('Ingrese la cantidad de pacientes atendidos: ');
    String? inputPacientes = stdin.readLineSync();
    if (inputPacientes == null) break;
    int? pacientes = int.tryParse(inputPacientes);
    if (pacientes == null) {
      print('Cantidad de pacientes inválida.');
      continue;
    }

    double pacientesAtendidosPorHora = pacientes / horas;
    String clasificacion;
    if (pacientesAtendidosPorHora < 3) {
      clasificacion = 'Atención Lenta';
    } else if (pacientesAtendidosPorHora >= 3 &&
        pacientesAtendidosPorHora < 6) {
      clasificacion = 'Atención Normal';
    } else {
      clasificacion = 'Atención Rápida';
    }

    print('Pacientes atendidos por hora: ${pacientesAtendidosPorHora.toStringAsFixed(2)} - $clasificacion');

    totalPacientes += pacientes;
    totalDoctores++;
  }

  print("");
  print('Resumen de registros');
  print('Total de pacientes atendidos: $totalPacientes');
  print('Cantidad de doctores registrados: $totalDoctores');

  if (totalDoctores > 0) {
    double promedio = totalPacientes / totalDoctores;
    print('Promedio de pacientes atendidos por doctor: ${promedio.toStringAsFixed(2)}');
  } else {
    print('Promedio de pacientes atendidos por doctor: 0.00');
  }
}

