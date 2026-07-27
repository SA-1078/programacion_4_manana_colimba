import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class PantallaDetalle extends StatelessWidget {
  final String id;
  final ServidorSSH? servidor;

  const PantallaDetalle({super.key, required this.id, this.servidor});

  @override
  Widget build(BuildContext context) {
    final srv = servidor ?? servidoresSimulados.firstWhere((s) => s.id == id, orElse: () => servidoresSimulados.first);

    return Scaffold(
      appBar: AppBar(title: Text(srv.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.smartphone, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 16),
            Text(srv.nombre, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Especificaciones: ${srv.ip}', style: const TextStyle(fontSize: 16)),
            Text('Precio: \$${srv.puerto} USD', style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold)),
            Text('Soporta 5G: ${srv.ssl ? "Sí" : "No"}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
