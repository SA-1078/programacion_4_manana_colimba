import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/metricas_provider.dart';

class PantallaMetricas extends ConsumerWidget {
  const PantallaMetricas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricasAsync = ref.watch(metricasProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Métricas de Ventas Riverpod')),
      body: metricasAsync.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (ctx, i) => ListTile(
            leading: const Icon(Icons.show_chart),
            title: Text(list[i].servidor),
            subtitle: Text('Ventas: ${list[i].conexiones} unidades'),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
