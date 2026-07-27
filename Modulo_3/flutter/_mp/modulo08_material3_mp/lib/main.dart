// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo08_material3_mp/widgets/catalogo_botones.dart';
import 'screens/pantalla_tema.dart';
import 'screens/pantalla_appbar.dart';
import 'screens/pantalla_navegacion.dart';
import 'screens/pantalla_dialogs.dart';

const int paso = 6;

void main() => runApp(const AppMovilExpress());

class AppMovilExpress extends StatefulWidget {
  const AppMovilExpress({super.key});
  @override
  State<AppMovilExpress> createState() => _AppMovilExpressState();
}

class _AppMovilExpressState extends State<AppMovilExpress> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color.fromARGB(255, 97, 0, 224);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTema(
          themeMode: _themeMode,
          onToggle: (mode) => setState(() => _themeMode = mode),
        ),
        3 => const PantallaAppBar(),
        4 => const CatalogoBotones(),
        5 => const PantallaNavegacion(),
        6 => const PantallaDialogs(),
        _ => Scaffold(
            body: Center(child: Text('Paso : crea el widget primero'))),
      },
    );
  }
}

class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Tienda MovilExpress'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.smartphone, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Samsung Galaxy S24 Ultra',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '512GB · 12GB RAM · Snapdragon 8 Gen 3',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.shopping_cart),
              label: const Text('Comprar Equipo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
