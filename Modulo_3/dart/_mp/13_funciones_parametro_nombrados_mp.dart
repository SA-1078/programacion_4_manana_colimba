// required → el parámetro es obligatorio
// sin required → es opcional (necesita valor por defecto o ser nullable)
void registrarDispositivo({
  required String marca,
  required String modelo,
  bool   garantia      = true,
  int    mesesGarantia = 12,
}) {
  final tipoGarantia = garantia ? 'Con garantia' : 'Sin garantia';
  print('Registrando $marca $modelo — $tipoGarantia ($mesesGarantia meses)');
}


void main() {
  // Los nombrados pueden pasarse en cualquier orden
  registrarDispositivo(
    marca:          'Samsung',
    modelo:         'Galaxy S24',
    garantia:       true,
    mesesGarantia:  24,
  );

  // Solo los obligatorios — los opcionales toman su valor por defecto
  registrarDispositivo(
    marca:  'Apple',
    modelo: 'iPhone 15 Pro',
  );
}
