import 'package:flutter/material.dart';
import 'widgets/formulario_servidor.dart';
import 'models/servidor_ssh.dart';
import 'widgets/fila_servidor.dart';
import 'screens/pantalla_servidores.dart';
import 'screens/pantalla_busqueda.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A148C)),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaServidores(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(body: Center(child: Text('Paso $paso no definido'))),
  },
));

class _Paso1 extends StatelessWidget {
  const _Paso1();
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Registro Rápido de Celulares')),
    body: const Center(child: Text('Formulario paso 1')),
  );
}

class _Paso2 extends StatelessWidget {
  const _Paso2();
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Nuevo Equipo Móvil')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: FormularioServidor(onGuardar: (d) {}),
    ),
  );
}

class _Paso3 extends StatelessWidget {
  const _Paso3();
  @override
  Widget build(BuildContext context) => const PantallaServidores();
}
