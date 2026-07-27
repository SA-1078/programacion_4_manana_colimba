import { Text, View } from 'react-native';

interface TarjetaSmartphoneProps {
  nombre: string;
  ip: string;
  sistema: string;
  puerto?: number;
}

export function TarjetaServidor({ nombre, ip, sistema }: TarjetaSmartphoneProps) {
  return (
    <View>
      <Text>{nombre}</Text>
      <Text>{ip} · {sistema}</Text>
    </View>
  );
}
