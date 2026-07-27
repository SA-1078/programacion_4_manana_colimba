import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';
import '../widgets/fila_servidor.dart';

class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});

  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _servidores = [
    ServidorSSH(id: '1', nombre: 'Samsung Galaxy S24 Ultra', ip: '512GB Titanium', puerto: 1299, usuario: 'Samsung', so: 'Android 14', ssl: true, favorito: true),
    ServidorSSH(id: '2', nombre: 'iPhone 15 Pro Max', ip: '256GB Natural', puerto: 1199, usuario: 'Apple', so: 'iOS 17', ssl: true, favorito: true),
    ServidorSSH(id: '3', nombre: 'Xiaomi 14 Ultra', ip: '512GB Black', puerto: 999, usuario: 'Xiaomi', so: 'HyperOS', ssl: true, favorito: false),
    ServidorSSH(id: '4', nombre: 'Motorola Edge 50 Pro', ip: '256GB Lavender', puerto: 699, usuario: 'Motorola', so: 'Android 14', ssl: false, favorito: false),
  ];

  String _busqueda = '';

  @override
  Widget build(BuildContext context) {
    final filtrados = _servidores.where((s) => s.nombre.toLowerCase().contains(_busqueda.toLowerCase()) || s.usuario.toLowerCase().contains(_busqueda.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Buscador de Equipos Móviles')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              hintText: 'Buscar por modelo o marca...',
              onChanged: (v) => setState(() => _busqueda = v),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filtrados.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                servidor: filtrados[i],
                onFavorito: () => setState(() => filtrados[i].favorito = !filtrados[i].favorito),
                onEliminar: () => setState(() => _servidores.remove(filtrados[i])),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
