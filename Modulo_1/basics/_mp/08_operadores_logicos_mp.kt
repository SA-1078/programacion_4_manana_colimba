fun main() {
  println("Operacion Logicos para Promociones")
  val esClienteVIP=true
  val tieneCupon=false
  val hayStock=true
  println("&& - And Logico")
  println("$esClienteVIP && $tieneCupon : ${esClienteVIP&&tieneCupon}")
  println("$hayStock && $esClienteVIP : ${hayStock&&esClienteVIP}")
  println("|| - Or Logico")
  println("$esClienteVIP || $tieneCupon : ${esClienteVIP||tieneCupon}")
  println("$hayStock || $esClienteVIP : ${hayStock||esClienteVIP}")
  println("! - Not Logico")
  println("!$esClienteVIP : ${!esClienteVIP}")
  println("!$hayStock : ${!hayStock}")
}
