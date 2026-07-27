import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class FilaServidor extends StatelessWidget {
  final ServidorSSH servidor;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaServidor({
    super.key,
    required this.servidor,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: cs.primaryContainer,
        child: Icon(Icons.smartphone, color: cs.onPrimaryContainer),
      ),
      title: Text(servidor.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${servidor.ip} · ${servidor.usuario} · \$${servidor.puerto}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              servidor.favorito ? Icons.star : Icons.star_border,
              color: servidor.favorito ? Colors.amber : null,
            ),
            onPressed: onFavorito,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: onEliminar,
          ),
        ],
      ),
    );
  }
}
