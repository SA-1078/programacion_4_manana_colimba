import 'package:flutter/material.dart';

class ServicioEstado extends StatefulWidget {
  final String nombre;
  const ServicioEstado({super.key, required this.nombre});

  @override
  State<ServicioEstado> createState() => _ServicioEstadoState();
}

class _ServicioEstadoState extends State<ServicioEstado> {
  bool   _disponible = true;
  int    _stock      = 10;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      margin:  const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:        cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                _disponible ? Icons.check_circle : Icons.remove_shopping_cart,
                color: _disponible ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _disponible ? 'Disponible en exhibición' : 'Agotado en tienda',
            style: TextStyle(
              color: _disponible ? Colors.green.shade700 : Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text('Stock en almacén: $_stock unidades'),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                if (_stock > 0) {
                  _stock--;
                  if (_stock == 0) _disponible = false;
                } else {
                  _stock = 10;
                  _disponible = true;
                }
              });
            },
            icon: const Icon(Icons.refresh),
            label: Text(_stock > 0 ? 'Vender 1 Unidad' : 'Restablecer Stock'),
          ),
        ],
      ),
    );
  }
}
