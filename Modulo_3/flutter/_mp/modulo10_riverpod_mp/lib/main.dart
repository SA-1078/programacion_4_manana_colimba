import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/pantalla_servidores.dart';
import 'screens/pantalla_busqueda.dart';
import 'screens/pantalla_metricas.dart';
import 'screens/pantalla_dashboard.dart';

const int paso = 5;

void main() {
  runApp(const ProviderScope(child: AppMovilExpressRiverpod()));
}

class AppMovilExpressRiverpod extends StatelessWidget {
  const AppMovilExpressRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695C)),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => Scaffold(appBar: AppBar(title: const Text('Riverpod Paso 1'))),
        2 => const PantallaServidores(),
        3 => const PantallaBusqueda(),
        4 => const PantallaMetricas(),
        5 => const PantallaDashboard(),
        _ => Scaffold(body: Center(child: Text('Paso $paso'))),
      },
    );
  }
}
