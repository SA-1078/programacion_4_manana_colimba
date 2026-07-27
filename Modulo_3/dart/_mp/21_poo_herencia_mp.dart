// Clase base — comportamiento y datos comunes
class Electronico {
  final String marca;
  final int    anio;

  Electronico(this.marca, this.anio);

  // Método que cada subclase debe especializar
  String descripcion() => 'Dispositivo electrónico';

  // Método común — reutilizado sin cambios por todas las subclases
  void mostrarInfo() {
    print('$marca ($anio) — ${descripcion()}');
  }
}

// HERENCIA: Smartphone y Tablet reutilizan Electronico y lo especializan
class Smartphone extends Electronico {
  final int ram;
  Smartphone(super.marca, super.anio, this.ram);

  @override
  String descripcion() => 'Smartphone con ${ram}GB RAM';

  void realizarLlamada() => print('$marca marcando número...');
}

class Tablet extends Electronico {
  final double pantallaPulgadas;
  Tablet(super.marca, super.anio, this.pantallaPulgadas);

  @override
  String descripcion() => 'Tablet de $pantallaPulgadas pulgadas';

  void leerEbook() => print('$marca abriendo libro digital 📖');
}

void main() {
  final movil  = Smartphone('Samsung Galaxy S24', 2024, 12);
  final tablet = Tablet('iPad Air', 2023, 10.9);

  movil.mostrarInfo();   // Samsung Galaxy S24 (2024) — Smartphone con 12GB RAM
  tablet.mostrarInfo();  // iPad Air (2023) — Tablet de 10.9 pulgadas

  movil.realizarLlamada();
  tablet.leerEbook();
}
