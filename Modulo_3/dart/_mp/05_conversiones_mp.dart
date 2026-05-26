void main() {
  // Conversiones numéricas
  int stockUnidades = 15;
  double stockDecimal = stockUnidades.toDouble(); // 15.0
  String textoStock = stockUnidades.toString(); // "15"

  // String → número
  int unidades = int.parse('25'); // 25
  double precio = double.parse('999.99'); // 999.99

  // Conversión segura (no lanza excepción)
  int? codigoProducto = int.tryParse('S24X'); // null — no es número
  double? precioIngresado = double.tryParse('699'); // 699.0

  // Verificar tipo con is (como en Kotlin)
  Object valor = 'Samsung Galaxy S24';
  if (valor is String) {
    print(valor.length); // smart cast — ya es String
  }

  // Cast explícito con as
  Object obj = 'iPhone 15 Pro';
  String modelo = obj as String;

  // Comprobar nulabilidad
  String? imei = null;
  int longitud = imei?.length ?? 0;
  print(longitud); // 0

  // Números especiales
  print(double.infinity);   // Infinity
  print(double.nan);        // NaN
  print(double.maxFinite);  // 1.7976931348623157e+308
}
