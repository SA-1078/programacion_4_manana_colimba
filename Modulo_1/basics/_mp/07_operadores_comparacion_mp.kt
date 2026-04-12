fun main() {
  println("Operacion de Comparacion de Equipos")
  val precioEquipoA=1500
  val precioEquipoB=1000
  println("$precioEquipoA==$precioEquipoB=${precioEquipoA==precioEquipoB}")
  println("$precioEquipoA .equals $precioEquipoB=${precioEquipoA.equals(precioEquipoB)}")
  println("$precioEquipoA != $precioEquipoB=${precioEquipoA!=precioEquipoB}")
  println("$precioEquipoA > $precioEquipoB=${precioEquipoA>precioEquipoB}")
  println("$precioEquipoA >= $precioEquipoB=${precioEquipoA>=precioEquipoB}")
  println("$precioEquipoA < $precioEquipoB=${precioEquipoA<precioEquipoB}")
  println("$precioEquipoA <= $precioEquipoB=${precioEquipoA<=precioEquipoB}")
}
