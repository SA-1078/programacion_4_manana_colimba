import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaServidores extends StatelessWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Smartphones (GoRouter)')),
      body: ListView.builder(
        itemCount: servidoresSimulados.length,
        itemBuilder: (ctx, i) {
          final s = servidoresSimulados[i];
          return ListTile(
            leading: const Icon(Icons.smartphone),
            title: Text(s.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${s.ip} · \$${s.puerto}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/detalle/${s.id}', extra: s),
          );
        },
      ),
    );
  }
}
