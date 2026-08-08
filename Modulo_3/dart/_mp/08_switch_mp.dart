void main() {
  String estadoPedido = 'ENVIADO';

  switch (estadoPedido) {
    case 'PENDIENTE':
      print('Esperando confirmacion de pago');
    case 'CONFIRMADO':
      print('Pago confirmado, preparando envio');
    case 'ENVIADO':
      print('Dispositivo en camino');
    case 'ENTREGADO':
      print('Dispositivo entregado al cliente');
    case 'CANCELADO':
      print('Pedido cancelado');
    default:
      print('Estado desconocido');
  }

  estadoPedido = 'ENVIADO';

  String descripcion = switch (estadoPedido) {
    'PENDIENTE'   => 'Pendiente — esperando pago del cliente',
    'CONFIRMADO'  => 'Confirmado — en preparacion para despacho',
    'ENVIADO'     => 'Enviado — dispositivo en camino al cliente',
    'ENTREGADO'   => 'Entregado — recibido exitosamente',
    'CANCELADO'   => 'Cancelado — se procesara reembolso',
    'DEVOLUCION'  => 'Devolucion — dispositivo retornado a tienda',
    _             => 'Estado de pedido desconocido',
  };

  print(descripcion); // Enviado — dispositivo en camino al cliente
  print('');

  int codigoMarca = 2;

  // Múltiples valores en una rama con ||
  String tipoMarca = switch (codigoMarca) {
    1 || 2          => 'Marca premium (Apple, Samsung)',
    3 || 4          => 'Marca popular (Xiaomi, Motorola)',
    5 || 6 || 7     => 'Marca emergente',
    _               => 'Marca no registrada',
  };

  print(tipoMarca); // Marca premium (Apple, Samsung)

  // Guards — condición adicional con 'when'
  double precioDispositivo = 1250.0;

  String clasificacion = switch (precioDispositivo) {
    double p when p >= 1200.0 => '💎 PREMIUM — gama ultra alta',
    double p when p >= 800.0  => '🥇 GAMA ALTA — tope de gama',
    double p when p >= 400.0  => '🥈 GAMA MEDIA — buen desempeño',
    double p when p >= 100.0  => '🥉 GAMA BAJA — accesible',
    _                         => '❓ PRECIO FUERA DE RANGO',
  };

  print(clasificacion); // 💎 PREMIUM — gama ultra alta
}
