import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class TarjetaServidorGrid extends StatelessWidget {
  final ServidorSSH servidor;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaServidorGrid({
    super.key,
    required this.servidor,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.smartphone, color: cs.primary),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        servidor.favorito ? Icons.star : Icons.star_border,
                        color: servidor.favorito ? Colors.amber : null,
                      ),
                      onPressed: onFavorito,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
                Text(
                  servidor.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${servidor.ip} · \$${servidor.puerto}',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
                Row(
                  children: [
                    Chip(
                      label: Text(servidor.ssl ? '5G' : '4G', style: const TextStyle(fontSize: 10)),
                      visualDensity: VisualDensity.compact,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 18),
                      onPressed: onEliminar,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
