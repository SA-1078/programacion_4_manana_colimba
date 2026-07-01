// lib/models/metrica_servidor.dart
class MetricaServidor {
  final String servidor;
  final double cpu;
  final double ram;
  final double ssd;
  final int    conexiones;

  const MetricaServidor({
    required this.servidor,
    required this.cpu,
    required this.ram,
    required this.ssd, 
    required this.conexiones,
  });
}