import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/servidor_ssh.dart';

class ServidoresNotifier extends Notifier<List<ServidorSSH>> {
  @override
  List<ServidorSSH> build() => [
    ServidorSSH(id: '1', nombre: 'Samsung Galaxy S24 Ultra', ip: '512GB Titanium', puerto: 1299, ssl: true, favorito: true),
    ServidorSSH(id: '2', nombre: 'iPhone 15 Pro Max', ip: '256GB Natural', puerto: 1199, ssl: true, favorito: true),
    ServidorSSH(id: '3', nombre: 'Xiaomi 14 Ultra', ip: '512GB Leica', puerto: 999, ssl: true, favorito: false),
    ServidorSSH(id: '4', nombre: 'Motorola Edge 50 Pro', ip: '256GB Lavender', puerto: 699, ssl: false, favorito: false),
  ];

  void toggleFavorito(String id) {
    state = [
      for (final s in state)
        if (s.id == id) ServidorSSH(id: s.id, nombre: s.nombre, ip: s.ip, puerto: s.puerto, ssl: s.ssl, favorito: !s.favorito)
        else s
    ];
  }
}

final servidoresProvider = NotifierProvider<ServidoresNotifier, List<ServidorSSH>>(ServidoresNotifier.new);
final busquedaProvider = StateProvider<String>((ref) => '');
final servidoresFiltradosProvider = Provider<List<ServidorSSH>>((ref) {
  final query = ref.watch(busquedaProvider).toLowerCase();
  final list = ref.watch(servidoresProvider);
  return list.where((s) => s.nombre.toLowerCase().contains(query)).toList();
});
