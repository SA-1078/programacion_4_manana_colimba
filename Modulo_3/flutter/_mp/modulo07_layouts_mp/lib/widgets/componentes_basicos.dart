import 'package:flutter/material.dart';

class ComponentesBasicos extends StatelessWidget {
  const ComponentesBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // SizedBox — espaciado fijo
        const Text('SizedBox', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Pantalla Dynamic AMOLED 2X 6.8"'),
        const SizedBox(height: 32),          // ← espacio fijo de 32px
        const Text('Procesador Snapdragon 8 Gen 3'),

        const Divider(height: 32),

        // Padding — espacio alrededor de un hijo
        const Text('Padding', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          color: Colors.indigo.shade50,
          child: const Padding(
            padding: EdgeInsets.only(left: 24),    // ← sangría izquierda
            child:   Text('Garantía Oficial de 12 Meses Incluida'),
          ),
        ),

        const Divider(height: 32),

        // Align — posicionar dentro del espacio disponible
        const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.centerRight,        // ← borde derecho
          child: Icon(Icons.settings, color: Colors.indigo),
        ),

        const Divider(height: 32),

        // Wrap — flujo automático de elementos
        const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing:    8,
          runSpacing: 8,
          children: ['5G', 'AMOLED 120Hz', 'Snapdragon 8 Gen 3', '256GB NVMe', 'Cámara 200MP', 'Carga 120W', 'NFC']
              .map((t) => Chip(label: Text(t)))
              .toList(),
        ),
      ],
    );
  }
}
