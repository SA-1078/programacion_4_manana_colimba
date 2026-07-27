// En React web usarías <div> y <span>.
// En React Native usas <View> y <Text> — el resultado es nativo real.

interface TarjetaServidorProps {
  nombre: string
  ip: string
  sistema: string
}

function TarjetaServidor({ nombre, ip, sistema }: TarjetaServidorProps) {
  return (
    <View>
      <Text>{nombre}</Text>
      <Text>{ip} · {sistema}</Text>
    </View>
  )
}