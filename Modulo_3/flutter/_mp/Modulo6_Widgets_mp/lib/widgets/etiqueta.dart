import 'package:flutter/material.dart';

class Etiqueta extends StatelessWidget {
  final String  texto;
  final Color   color;
  final double  fontSize;        // parámetro con valor por defecto
  final bool    relleno;         // controla si el fondo tiene opacidad alta
  final IconData? icono;         // ← nuevo: muestra un icono antes del texto

  const Etiqueta({
    super.key,
    required this.texto,
    required this.color,
    this.fontSize = 13,          // opcional — no necesita required
    this.relleno  = false,
    this.icono,                  // opcional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        shape:  BoxShape.rectangle,           // explícito (valor por defecto)
        // gradient reemplaza a color ──────────────────────────────────────────
        gradient: LinearGradient(
          colors: [
            color.withOpacity(relleno ? 0.25 : 0.1),
            color.withOpacity(relleno ? 0.50 : 0.25),
          ],
        ),
        // subrayado inferior en lugar de borde completo ───────────────────────
        border: Border(
          bottom: BorderSide(color: color, width: 2),
        ),
        // circular(4): de píldora a rectángulo redondeado ─────────────────────
        // prueba circular(0) para esquinas completamente rectas
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color:      color.withOpacity(0.2),
            blurRadius: 6,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // muestra el icono si se proporciona ──────────────────────────────
          if (icono != null) ...[
            Icon(icono, size: fontSize, color: color),
            const SizedBox(width: 6),
          ],
          Text(
            texto,
            style: TextStyle(
              color:      color,
              fontWeight: FontWeight.w600,
              fontSize:   fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

