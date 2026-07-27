import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class PantallaServidoresFiltro extends StatelessWidget {
  final bool soloSSL;
  const PantallaServidoresFiltro({super.key, this.soloSSL = false});

  @override
  Widget build(BuildContext context) {
    final list = soloSSL ? servidoresSimulados.where((s) => s.ssl).toList() : servidoresSimulados;

    return Scaffold(
      appBar: AppBar(title: Text(soloSSL ? 'Smartphones 5G' : 'Todos los Smartphones')),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: const Icon(Icons.cell_tower),
          title: Text(list[i].nombre),
          subtitle: Text(list[i].ip),
        ),
      ),
    );
  }
}
