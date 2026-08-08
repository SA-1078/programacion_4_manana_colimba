void main() {
  // Tipo no-nullable — NUNCA puede ser null
  String marca = 'Samsung';
  // marca = null;       // ERROR de compilación

  // Tipo nullable — puede ser null (añadir ?)
  String? modelo = null;   // OK
  modelo = 'Galaxy S24';   // OK

  // Operadores de null safety
  String? color = 'Negro Titanio';

  // ?. — safe call (igual que en Kotlin)
  print(color.length);      // 14 — no lanza excepción

  // ?? — operador Elvis (igual que ?: en Kotlin)
  String resultado = color ?? 'Sin color especificado';
  print(resultado);           // Negro Titanio

  // ! — non-null assertion (igual que !! en Kotlin) — úsalo con precaución
  String colorSeguro = color;  // lanza si color es null

  // Null check con if
  print(modelo.length);   // smart cast — ya es String aquí

  // late — inicialización diferida (como lateinit en Kotlin)
  late String imei;
  imei = '356938035643809';   // debe asignarse antes de usar
  print(imei);
}
