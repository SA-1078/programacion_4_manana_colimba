import { ReactNode } from 'react'

interface CardProps {
  children: ReactNode       // cualquier JSX válido
  titulo: string
}

function Card({ titulo, children }: CardProps) {
  return (
    <View>
      <Text>{titulo}</Text>
      {children}
    </View>
  )
}

// Uso:
<Card titulo="web-01">
  <Text>10.0.2.10 · Ubuntu 24.04</Text>
  <Text>Estado: Activo</Text>
</Card>