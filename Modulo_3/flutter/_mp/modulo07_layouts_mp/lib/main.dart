// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/tarjeta_log.dart';
import 'widgets/fila_estado.dart';
import 'widgets/avatar_badge.dart';
import 'widgets/componentes_basicos.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
      appBar: AppBar(title: const Text('Registro de Ventas de Móviles')),
      body: ListView(
        children: [
          TarjetaLog(nivel: 'VENTA', componente: 'Samsung S24',
              mensaje:   'Venta realizada: S24 Ultra 512GB Titanium (Contado)',
              timestamp: DateTime.now()),
          TarjetaLog(nivel: 'OFERTA',  componente: 'iPhone 15',
              mensaje:   'Descuento aplicado 15% por pago con Tarjeta',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaLog(nivel: 'STOCK',  componente: 'Xiaomi Redmi',
              mensaje:   'Ingreso de lote: 50 unidades Redmi Note 13',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaLog(nivel: 'RESERVA', componente: 'Motorola Edge',
              mensaje:   'Reserva de cliente realizada en sucursal',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => Scaffold(
      appBar: AppBar(title: const Text('Inventario de Modelos Móviles')),
      body: const Column(
        children: [
          FilaEstado(nombre: 'Samsung Galaxy S24 Ultra', detalle: '512GB · 12GB RAM · 5G', activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'iPhone 15 Pro Max',        detalle: '256GB · Chip A17 Pro', activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Xiaomi 14 Ultra',          detalle: '512GB · Cámara Leica · Sin Stock', activo: false),
          Divider(height: 1),
          FilaEstado(nombre: 'Motorola Edge 50 Ultra',   detalle: '1TB · Carga 125W · 5G', activo: true),
        ],
      ),
    ),
    4 => Scaffold(
      appBar: AppBar(title: const Text('Marcas Destacadas en Exhibición')),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadge(nombre: 'Samsung', alertas: 5, activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Apple',   alertas: 0, activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Xiaomi',  alertas: 0, activo: false),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Motorola', alertas: 3, activo: true),
          ],
        ),
      ),
    ),
    5 => Scaffold(
      appBar: AppBar(title: const Text('Especificaciones de Smartphones')),
      body: const ComponentesBasicos(),
    ),
    _ => Scaffold(body: Center(child: Text('Paso : crea el widget primero'))),
  },
));

Widget _paso1() => Scaffold(
  appBar: AppBar(title: const Text('Móvil Destacado')),
  body: Center(
    child: Container(
      width: 240,
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Samsung S24 Ultra 5G', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text('\$1,299 USD · En Stock', style: TextStyle(color: Colors.deepPurple, fontSize: 13)),
        ],
      ),
    ),
  ),
);
