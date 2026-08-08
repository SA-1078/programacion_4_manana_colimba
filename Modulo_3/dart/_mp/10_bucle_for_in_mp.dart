void main() {
  final marcas = ['Samsung', 'Apple', 'Xiaomi', 'Motorola', 'Huawei'];

  // for-in — la forma idiomática para recorrer listas
  for (final marca in marcas) {
    print(marca);
  }

  // forEach con lambda — alternativa funcional
  marcas.forEach((m) => print(m.toLowerCase()));

  // for-in sobre un Map
  final precios = {'Galaxy S24': 999.99, 'iPhone 15 Pro': 1299.99, 'Xiaomi 14': 699.99, 'Motorola Edge 40': 499.99};
  for (final entrada in precios.entries) {
    print('${entrada.key} → precio \$${entrada.value}');
  }

  // for-in sobre caracteres de un String
  for (final caracter in 'S24'.split('')) {
    print(caracter);
  }
}
