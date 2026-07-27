import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/servidores_provider.dart';

class PantallaBusqueda extends ConsumerWidget {
  const PantallaBusqueda({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtrados = ref.watch(servidoresFiltradosProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscador Riverpod MovilExpress')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              hintText: 'Buscar smartphone...',
              onChanged: (v) => ref.read(busquedaProvider.notifier).state = v,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtrados.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: const Icon(Icons.smartphone),
                title: Text(filtrados[i].nombre),
                subtitle: Text(filtrados[i].ip),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
