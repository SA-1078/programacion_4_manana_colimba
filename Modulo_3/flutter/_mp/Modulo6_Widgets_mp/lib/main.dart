// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'screens/pantalla_contexto.dart';
import 'widgets/indicador.dart';

const int paso = 3;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    ),
    home: switch (paso) {
      1 => const Scaffold(body: Center(child: Saludo())),
      2 => const CatalogoBasicos(),
      3 => const Scaffold(
            body: Center(
              child: Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  Etiqueta(texto: 'En Stock', color: Colors.green, icono: Icons.check_circle, relleno: true),
                  Etiqueta(texto: 'Agotado', color: Colors.red, icono: Icons.remove_shopping_cart, relleno: true),
                  Etiqueta(texto: 'En Reserva', color: Colors.orange, icono: Icons.hourglass_empty, relleno: true),
                  Etiqueta(texto: 'Oferta 5G', color: Colors.purple, icono: Icons.bolt, fontSize: 16, relleno: true),
                  Etiqueta(texto: 'Garantía 12M', color: Colors.blue, icono: Icons.verified, fontSize: 11, relleno: true),
                ],
              ),
            ),
          ),
      4 => const Scaffold(
            body: Center(
              child: ServicioEstado(nombre: 'Samsung Galaxy S24 Ultra'),
            ),
          ),
      5 => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContadorLimitado(
                  etiqueta: 'Reserva de Celulares',
                  limite: 3,
                  color: Colors.deepPurple,
                  textoBoton: 'Añadir al Carrito',
                  onLimite: () => debugPrint('¡Límite de unidades por cliente alcanzado!'),
                ),
                const SizedBox(height: 40),
                ContadorLimitado(
                  etiqueta: 'Stock en Exhibición',
                  limite: 15,
                  color: Colors.indigo,
                ),
              ],
            ),
          ),
        ),
      6 => Scaffold(
            appBar: AppBar(title: const Text('Temporizador de Oferta Flash')),
            body: const Center(child: Reloj()),
          ),
      7 => const PantallaContexto(),
      8 => Scaffold(
            body: Center(
              child: Wrap(
                spacing: 32,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: const [
                  Indicador(label: 'Equipos Disponibles', valor: '154', color: Colors.green, icono: Icons.smartphone),
                  Indicador(label: 'Ventas del Día', valor: '28', color: Colors.blue, icono: Icons.shopping_cart, subtitulo: 'Sucursal Central'),
                  Indicador(label: 'Modelos con 5G', valor: '42', color: Colors.indigo, icono: Icons.cell_tower),
                  Indicador(label: 'Satisfacción Cliente', valor: '99.8%', color: Colors.teal, subtitulo: 'Últimos 30 días'),
                ],
              ),
            ),
          ),
      _ => Scaffold(body: Center(child: Text('Paso : crea el widget primero'))),
    },
  ),
);

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'MovilExpress - Equipos Móviles',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.deepPurple,
        shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))],
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.fade,
      maxLines: 2,
      softWrap: false,
    );
  }
}
