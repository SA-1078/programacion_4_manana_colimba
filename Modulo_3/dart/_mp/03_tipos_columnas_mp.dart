void main() {
  // List — lista ordenada (como List en Kotlin)
  List<String> marcas    = ['Samsung', 'Apple', 'Xiaomi'];
  var          precios   = [999.99, 1299.99, 699.99];  // tipo inferido: List<double>

  print(marcas[0]);         // Samsung
  print(marcas.length);     // 3
  marcas.add('Motorola');
  marcas.remove('Xiaomi');

  // Map — clave → valor (como Map en Kotlin)
  Map<String, double> catalogo = {
    'Galaxy S24':    999.99,
    'iPhone 15 Pro': 1299.99,
    'Xiaomi 14':     699.99,
  };

  print(catalogo['Galaxy S24']);    // 999.99
  print(catalogo['Oppo A98']);      // null — clave no existe
  catalogo['Motorola Edge 40'] = 499.99;  // añadir

  // Set — sin duplicados (como Set en Kotlin)
  Set<String> categorias = {'smartphones', 'tablets', 'wearables'};
  categorias.add('smartphones');    // ignorado — ya existe
  print(categorias.length);         // 3

  // Spread operator — para combinar colecciones
  var gamaMedia  = ['Galaxy A55', 'iPhone SE'];
  var gamaAlta   = ['Galaxy S24', 'iPhone 15 Pro'];
  var todosLosTelefonos = [...gamaMedia, ...gamaAlta];  // combinados
  print(todosLosTelefonos);

  // Collection if — elementos condicionales
  bool mostrarGamaAlta = true;
  var disponibles = [
    'Motorola Edge 40',
    'Xiaomi 14',
    if (mostrarGamaAlta) 'iPhone 15 Pro',  // solo si la condición es true
  ];

  // Collection for — generar precios con IVA
  var preciosBase   = [299.99, 499.99, 999.99];
  var preciosConIva = [for (var p in preciosBase) p * 1.19];
  print(preciosConIva);
}
