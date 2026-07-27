import { Text, View } from 'react-native';

interface TarjetaSmartphoneProps {
  modelo: string;
  marca: string;
  pantalla: string;
  precio: number;
}

export function TarjetaSmartphone({ modelo, marca, pantalla, precio }: TarjetaSmartphoneProps) {
  return (
    <View>
      <Text>{marca} {modelo}</Text>
      <Text>{pantalla} · ${precio}</Text>
    </View>
  );
}
