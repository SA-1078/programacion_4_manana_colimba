class ServidorSSH {
  final String id;
  final String nombre;
  final String ip;
  final int puerto;
  final bool ssl;

  const ServidorSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.ssl,
  });
}

const servidoresSimulados = [
  ServidorSSH(id: '1', nombre: 'Samsung Galaxy S24 Ultra', ip: '512GB Titanium', puerto: 1299, ssl: true),
  ServidorSSH(id: '2', nombre: 'iPhone 15 Pro Max', ip: '256GB Natural', puerto: 1199, ssl: true),
  ServidorSSH(id: '3', nombre: 'Xiaomi 14 Ultra', ip: '512GB Leica', puerto: 999, ssl: true),
  ServidorSSH(id: '4', nombre: 'Motorola Edge 50 Pro', ip: '256GB Lavender', puerto: 699, ssl: false),
];
