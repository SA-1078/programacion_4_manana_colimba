import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';
import '../widgets/fila_servidor.dart';
import '../widgets/tarjetaservidorgrid.dart';

class PantallaServidores extends StatefulWidget {
  const PantallaServidores({super.key});

  @override
  State<PantallaServidores> createState() => _PantallaServidoresState();
}

class _PantallaServidoresState extends State<PantallaServidores> {
  final _servidores = [
    ServidorSSH(id: '1', nombre: 'Samsung Galaxy S24 Ultra', ip: '512GB Titanium', puerto: 1299, usuario: 'Samsung', so: 'Android 14', ssl: true, favorito: true),
    ServidorSSH(id: '2', nombre: 'iPhone 15 Pro Max', ip: '256GB Natural', puerto: 1199, usuario: 'Apple', so: 'iOS 17', ssl: true, favorito: true),
    ServidorSSH(id: '3', nombre: 'Xiaomi 14 Ultra', ip: '512GB Black', puerto: 999, usuario: 'Xiaomi', so: 'HyperOS', ssl: true, favorito: false),
    ServidorSSH(id: '4', nombre: 'Motorola Edge 50 Pro', ip: '256GB Lavender', puerto: 699, usuario: 'Motorola', so: 'Android 14', ssl: false, favorito: false),
  ];

  bool _modoGrid = false;

  void _toggleFavorito(int i) => setState(() => _servidores[i].favorito = !_servidores[i].favorito);
  void _eliminar(int i) => setState(() => _servidores.removeAt(i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario de Equipos (${_servidores.length})'),
        actions: [
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _servidores.length,
              itemBuilder: (ctx, i) => TarjetaServidorGrid(
                servidor: _servidores[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount: _servidores.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                servidor: _servidores[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}
