import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, dynamic>) onGuardar;

  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlNombre = TextEditingController();
  final _ctrlIp = TextEditingController();
  final _ctrlPuerto = TextEditingController(text: '999');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(labelText: 'Modelo del Móvil', prefixIcon: Icon(Icons.smartphone)),
            validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlIp,
            decoration: const InputDecoration(labelText: 'Almacenamiento / Especificaciones', prefixIcon: Icon(Icons.memory)),
            validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlPuerto,
            decoration: const InputDecoration(labelText: 'Precio en USD', prefixIcon: Icon(Icons.attach_money)),
            keyboardType: TextInputType.number,
            validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onGuardar({
                  'nombre': _ctrlNombre.text,
                  'ip': _ctrlIp.text,
                  'puerto': int.tryParse(_ctrlPuerto.text) ?? 999,
                });
              }
            },
            icon: const Icon(Icons.save),
            label: const Text('Guardar Equipo'),
          ),
        ],
      ),
    );
  }
}
