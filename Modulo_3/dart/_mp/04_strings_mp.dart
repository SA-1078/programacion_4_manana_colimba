void main() {
  final marca  = 'Samsung';
  final precio = 999.99;

  // Interpolación con $ (igual que en Kotlin)
  print('Marca: $marca');                    // Marca: Samsung

  // Expresión con ${ }
  print('${marca.toUpperCase()} cuesta \$${precio.toStringAsFixed(2)} (precio base)');

  // String multilinea con triple comillas
  final ficha = '''
Marca:   $marca
Precio:  \$$precio
Gama:    ${precio >= 800 ? 'Alta' : 'Media'}
  ''';
  print(ficha);

  // Raw string — ignora el escape y la interpolación
  final rutaImagen = r'assets\images\samsung_galaxy.png';  // el \ no se interpreta
  print(rutaImagen);

  // Concatenación (menos idiomático — preferir interpolación)
  final etiqueta = 'Dispositivo: ' + marca + ' — disponible';

  // Métodos útiles de String
  print('galaxy s24'.toUpperCase());           // GALAXY S24
  print('  Samsung  '.trim());                 // Samsung
  print('Galaxy S24'.contains('Galaxy'));      // true
  print('Galaxy S24'.replaceAll('S', 'A'));    // Galaxy A24
  print('Samsung,Apple,Xiaomi'.split(','));     // [Samsung, Apple, Xiaomi]
  print('Galaxy S24'.substring(0, 6));         // Galaxy
  print('Galaxy'.startsWith('Gal'));           // true
  print('S24'.padLeft(6, '0'));                // 000S24
}
