import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/servidores_provider.dart';

class PantallaServidores extends ConsumerWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servidores = ref.watch(servidoresProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Inventario Riverpod (${servidores.length})')),
      body: ListView.separated(
        itemCount: servidores.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (ctx, i) {
          final s = servidores[i];
          return ListTile(
            leading: const Icon(Icons.smartphone),
            title: Text(s.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${s.ip} · \$${s.puerto}'),
            trailing: IconButton(
              icon: Icon(s.favorito ? Icons.star : Icons.star_border, color: s.favorito ? Colors.amber : null),
              onPressed: () => ref.read(servidoresProvider.notifier).toggleFavorito(s.id),
            ),
          );
        },
      ),
    );
  }
}
