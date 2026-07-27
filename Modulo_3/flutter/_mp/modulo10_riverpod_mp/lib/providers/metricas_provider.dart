import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaServidor>> {
  @override
  Future<List<MetricaServidor>> build() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      MetricaServidor(servidor: 'Samsung Galaxy S24 Ultra', cpu: 12.0, ram: 512.0, ssd: 1299.0, conexiones: 24),
      MetricaServidor(servidor: 'iPhone 15 Pro Max', cpu: 8.0, ram: 256.0, ssd: 1199.0, conexiones: 18),
    ];
  }
}

final metricasProvider = AsyncNotifierProvider<MetricasNotifier, List<MetricaServidor>>(MetricasNotifier.new);
