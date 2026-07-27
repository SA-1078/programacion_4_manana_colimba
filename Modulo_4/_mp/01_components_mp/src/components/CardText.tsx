import { ReactNode } from 'react';
import { Text, View } from 'react-native';

interface CardProps {
  children: ReactNode;
  titulo: string;
}

export function Card({ titulo, children }: CardProps) {
  return (
    <View>
      <Text>{titulo}</Text>
      {children}
    </View>
  );
}

// Ejemplo de uso en Venta de Equipos Móviles:
// <Card titulo="Galaxy S24 Ultra">
//   <Text>Samsung · 512GB · 12GB RAM</Text>
//   <Text>Estado: Disponible en Stock</Text>
// </Card>
