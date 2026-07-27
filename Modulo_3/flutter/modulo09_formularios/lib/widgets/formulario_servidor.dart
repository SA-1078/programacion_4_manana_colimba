
// lib/widgets/formulario_servidor.dart
import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlNombre  = TextEditingController();
  final _ctrlIp      = TextEditingController();
  final _ctrlMac     = TextEditingController();
  final _ctrlPuerto  = TextEditingController(text: '22');
  final _ctrlUsuario = TextEditingController(text: 'root');

  final _focusIp      = FocusNode();
  final _focusMac     = FocusNode();
  final _focusPuerto  = FocusNode();
  final _focusUsuario = FocusNode();

  String _so  = 'Ubuntu 24.04';
  bool   _ssl = true;

  final List<String> _servicios = ['Web', 'BD', 'SSH'];
  final List<String> _serviciosSeleccionados = [];

  // Expresión regular para validar IPv4 y MAC
  static final _regexIp = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
  static final _regexMac = RegExp(r'^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlIp.dispose();
    _ctrlMac.dispose();
    _ctrlPuerto.dispose();
    _ctrlUsuario.dispose();
    _focusIp.dispose();
    _focusMac.dispose();
    _focusPuerto.dispose();
    _focusUsuario.dispose();
    super.dispose();
  }

  void _guardar() {
    // validate() llama al validator de TODOS los TextFormField del Form
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':    _ctrlNombre.text,
      'ip':        _ctrlIp.text,
      'mac':       _ctrlMac.text,
      'puerto':    _ctrlPuerto.text,
      'usuario':   _ctrlUsuario.text,
      'so':        _so,
      'ssl':       _ssl.toString(),
      'servicios': _serviciosSeleccionados.join(', '),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // ── Nombre del servidor ───────────────────────────────────
          TextFormField(
            controller:      _ctrlNombre,
            decoration:      const InputDecoration(
              labelText:  'Nombre del servidor',
              hintText:   'prod-web-01',
              prefixIcon: Icon(Icons.dns),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusIp.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3)                  return 'Mínimo 3 caracteres';
              if (!RegExp(r'^[a-zA-Z0-9\-\_]+$').hasMatch(v))
                return 'Solo letras, números, guiones y guiones bajos';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Dirección IP ──────────────────────────────────────────
          TextFormField(
            controller:      _ctrlIp,
            focusNode:       _focusIp,
            decoration:      const InputDecoration(
              labelText:  'Dirección IP',
              hintText:   '192.168.1.100',
              prefixIcon: Icon(Icons.router),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusMac.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La IP es obligatoria';
              if (!_regexIp.hasMatch(v))  return 'Formato IPv4 inválido (ej. 192.168.1.10)';
              final octetos = v.split('.').map(int.parse).toList();
              if (octetos.any((o) => o > 255)) return 'Octeto fuera de rango (0–255)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Dirección MAC ──────────────────────────────────────────
          TextFormField(
            controller:      _ctrlMac,
            focusNode:       _focusMac,
            decoration:      const InputDecoration(
              labelText:  'Dirección MAC',
              hintText:   '00:1A:2B:3C:4D:5E',
              prefixIcon: Icon(Icons.settings_ethernet),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPuerto.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La dirección MAC es obligatoria';
              if (!_regexMac.hasMatch(v))  return 'Formato inválido (ej. 00:1A:2B:3C:4D:5E)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Puerto SSH ────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlPuerto,
            focusNode:       _focusPuerto,
            decoration:      const InputDecoration(
              labelText:  'Puerto',
              prefixIcon: Icon(Icons.lock_outline),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusUsuario.requestFocus(),
            validator: (v) {
              final puerto = int.tryParse(v ?? '');
              if (puerto == null)              return 'Puerto debe ser un número';
              if (puerto < 1 || puerto > 65535) return 'Puerto entre 1 y 65535';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Usuario ───────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlUsuario,
            focusNode:       _focusUsuario,
            decoration:      const InputDecoration(
              labelText:  'Usuario',
              prefixIcon: Icon(Icons.person_outline),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El usuario es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Sistema Operativo — DropdownButtonFormField ────────────
          DropdownButtonFormField<String>(
            value:      _so,
            decoration: const InputDecoration(
              labelText:  'Sistema Operativo',
              prefixIcon: Icon(Icons.computer),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Ubuntu 24.04', 'Debian 12', 'CentOS Stream 9',
              'Rocky Linux 9', 'Alpine Linux',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _so = v!),
          ),
          const SizedBox(height: 8),

          // ── SSL — SwitchListTile ──────────────────────────────────
          SwitchListTile(
            title:     const Text('Conexión SSL/TLS'),
            subtitle:  const Text('Cifrar la comunicación'),
            value:     _ssl,
            onChanged: (v) => setState(() => _ssl = v),
            secondary: const Icon(Icons.security),
          ),
          const SizedBox(height: 12),

          // ── Servicios Activos — Chips- SELECTOR ─────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Servicios Activos',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: _servicios.map((serv) {
                    final isSelected = _serviciosSeleccionados.contains(serv);
                    IconData icon;
                    switch (serv.toLowerCase()) {
                      case 'web':
                        icon = Icons.language;
                        break;
                      case 'bd':
                        icon = Icons.storage;
                        break;
                      case 'ssh':
                        icon = Icons.terminal;
                        break;
                      default:
                        icon = Icons.room_service;
                    }
                    return FilterChip(
                      avatar: Icon(
                        icon,
                        size: 18,
                        color: isSelected 
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(serv),
                      selected: isSelected,
                      selectedColor: Theme.of(context).colorScheme.primaryContainer,
                      checkmarkColor: Theme.of(context).colorScheme.onPrimaryContainer,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _serviciosSeleccionados.add(serv);
                          } else {
                            _serviciosSeleccionados.remove(serv);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  _formKey.currentState?.reset();
                  _ctrlNombre.clear();
                  _ctrlIp.clear();
                  _ctrlMac.clear();
                  _ctrlPuerto.text = '22';
                  _ctrlUsuario.text = 'root';
                  setState(() {
                    _so = 'Ubuntu 24.04';
                    _ssl = true;
                    _serviciosSeleccionados.clear();
                  });
                },
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar servidor'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}