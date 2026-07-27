import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
          Text(
            'nginx-proxy: En línea',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, // .w100–.w900  ·  .bold = .w700
              color: Colors.green,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal, // .italic
              decoration: TextDecoration.combine([
                TextDecoration.underline,
                TextDecoration.lineThrough,
              ]),
              shadows: const [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ───────────────────────────────────────
          // 1. TextOverflow.fade
          const SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east-version-2-debug-logs → sin respuesta (TextOverflow.fade)',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 8),

          // 2. TextOverflow.clip
          const SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east-version-2-debug-logs → sin respuesta (TextOverflow.clip)',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          const SizedBox(height: 8),

          // 3. maxLines: 2 con texto alargado
          const SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east → sin respuesta. Este es un texto bastante más largo para demostrar cómo aparece la segunda línea cuando cambiamos maxLines a 2.',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),

          // 4. softWrap: false al segundo Text (o un Text específico)
          const SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east → sin respuesta. Este es un texto largo que no debería saltar de línea porque softWrap está desactivado.',
              textAlign: TextAlign.center,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 8),

          // 5. textAlign: TextAlign.justify en el segundo Text (o un Text específico con texto largo)
          const SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east-version-2-debug-logs → sin respuesta. Este es un texto extremadamente largo y detallado que sirve para demostrar cómo funciona la alineación justificada (TextAlign.justify) en Flutter. Al justificar el texto, los espacios entre las palabras se distribuyen de manera uniforme para que el texto ocupe todo el ancho disponible tanto en el margen izquierdo como en el derecho.',
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich — estilos distintos en un solo widget ───────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'CRÍTICO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — última revisión hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── SelectableText — el usuario puede seleccionar y copiar ───────────
          const SelectableText(
            '10.0.0.12:5432',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          // ── Bloque 2 — Icon ──────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: 'Servidor activo',
                child: Icon(
                  Icons.check_circle_outline, // Contorno
                  size: 80, // Escala grande (80)
                  color: Theme.of(
                    context,
                  ).colorScheme.primary, // Color del tema
                ),
              ),
              const Icon(
                Icons.check_circle, // Relleno
                size: 40,
                color: Colors.green,
              ),
              const Icon(
                Icons.cancel,
                size: 14, // Escala pequeña (14)
                color: Colors.red,
              ),
              const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
              const Icon(Icons.dns, size: 40, color: Colors.indigo),
              const Icon(Icons.wifi_off, size: 40, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración',
          ), // leído por lectores de pantalla
          const Divider(height: 32),

          // Agrega a children: [ ... ]

          // BLOQUE 3 — Botones básicos ─────────────────────────────────────────────────────────────────────────────────────────────────
          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Ahora Activado'),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Reiniciar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info, size: 18),
                label: const Text('Información'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 18),
                label: const Text('Editar'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
                tooltip: 'Detiene todos los servicios', // Agregado tooltip
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado (Variaciones) ──────────────────────
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              // Elevation: 0, shape StadiumBorder, sin minimumSize
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                child: const Text(
                  'Plano (Elevation 0)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // Elevation: 12, shape StadiumBorder, sin minimumSize
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: const StadiumBorder(),
                  elevation: 12,
                ),
                child: const Text(
                  'Muy elevado (Elevation 12)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Divider(height: 32),

          // ── Bloque 4 — Card y ListTile ─────────────────────────────────────────────────────────────────────────────────────────────────────
          Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.dns, color: Colors.indigo),
              title: const Text('nginx-proxy'),
              subtitle: const Text('10.0.0.5 · 45ms'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap: () {}, // toda la fila queda tocable
            ),
          ),
          Card(
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title: const Text('backup-worker'),
              subtitle: const Text(
                'sin respuesta · 10.0.0.30. El servicio de backup ha dejado de responder y requiere atención inmediata.',
              ),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          const Divider(height: 32),

          // ── Bloque 5 — Chip ───────────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              const Chip(label: Text('nginx')),
              const Chip(
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle:      TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('TLS 1.4'),
                backgroundColor: Colors.blue,
                labelStyle:      TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('TLS 1.5'),
                backgroundColor: Colors.blue,
                labelStyle:      TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label:      const Text('HTTP/2'),
                selected:   true,
                onSelected: (_) {},
              ),
              ActionChip(
                label:     const Text('Ver logs'),
                avatar:    const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),

           // ── BLOQUE 6 - INDICADORES DE PROGRRESO ──────────────────────────────────────────────────────────
          // Agrega a children: [ ... ]

          // ── Circular ──────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: Transform.scale(
                  scale: 0.5, // Escala sin cambiar strokeWidth
                  child: const CircularProgressIndicator(),
                ),
              ), // value: null → animación continua
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: null, // Cambiado de 0.7 a null -> Animación continua
                  color: Colors.green,
                  backgroundColor: Colors.grey.shade200, // Pista visible
                  strokeWidth: 6,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  backgroundColor: Colors.grey.shade200, // Pista visible
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round, // puntas redondeadas
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal ────────────────────────────────────────────────────────────
          const LinearProgressIndicator(), // indeterminado
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 0.6,
            color: Colors.indigo,
          ), // 60 %
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 1.0,
            color: Colors.green,
            minHeight: 12, // barra más gruesa (Cambiado de 6 a 12)
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}
