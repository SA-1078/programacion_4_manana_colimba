class DispositivoMovil {
  final String marca;
  final String modelo;
  final double precio;
  final bool   tieneGarantia;

  // Constructor principal
  DispositivoMovil({
    required this.marca,
    required this.modelo,
    required this.precio,
    this.tieneGarantia = true,
  });

  // Constructor nombrado — gama baja con configuración predefinida
  DispositivoMovil.gamaBaja({required this.marca, required this.modelo})
      : precio        = 199.99,
        tieneGarantia = false;

  DispositivoMovil.gamaAlta({required this.marca, required this.modelo})
      : precio        = 1099.99,
        tieneGarantia = true;

  // Constructor factory — crea desde un código de referencia
  factory DispositivoMovil.desdeReferencia(String referencia) {
    final partes = referencia.split('-');
    return DispositivoMovil(
      marca:  partes[0],
      modelo: partes[1],
      precio: double.tryParse(partes[2]) ?? 0.0,
    );
  }

  @override
  String toString() =>
      '${tieneGarantia ? "✔" : "✘"} $marca $modelo — \$${precio.toStringAsFixed(2)}';
}

void main() {
  final d1 = DispositivoMovil(marca: 'Samsung', modelo: 'Galaxy S24', precio: 999.99);
  final d2 = DispositivoMovil.gamaBaja(marca: 'Alcatel', modelo: '1B');
  final d3 = DispositivoMovil.gamaAlta(marca: 'Apple', modelo: 'iPhone 15 Pro');
  final d4 = DispositivoMovil.desdeReferencia('Motorola-Edge40-499.99');

  print(d1);  // ✔ Samsung Galaxy S24 — $999.99
  print(d2);  // ✘ Alcatel 1B — $199.99
  print(d3);  // ✔ Apple iPhone 15 Pro — $1099.99
  print(d4);  // ✔ Motorola Edge40 — $499.99
}
