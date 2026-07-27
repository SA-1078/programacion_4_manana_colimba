import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pantalla_servidores.dart';
import 'pantalla_metricas.dart';

final indiceTabProvider = StateProvider<int>((ref) => 0);

class PantallaDashboard extends ConsumerWidget {
  const PantallaDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idx = ref.watch(indiceTabProvider);

    return Scaffold(
      body: IndexedStack(
        index: idx,
        children: const [
          PantallaServidores(),
          PantallaMetricas(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx,
        onDestinationSelected: (i) => ref.read(indiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.smartphone), label: 'Equipos'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Métricas'),
        ],
      ),
    );
  }
}
