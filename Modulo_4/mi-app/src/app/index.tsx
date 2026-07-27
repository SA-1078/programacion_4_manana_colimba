/*
// app/index.tsx
import { Alert, Image, Pressable, StyleSheet, Text, View } from 'react-native'

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Texto y vistas básicas                               │
// │  2  Paso 2  Imágenes y botones                                   │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 2

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    default:
      return (
        <View style={styles.contenedor}>
          <Text>Paso {PASO}: crea la pantalla primero</Text>
        </View>
      )
  }
}

function Paso1() {
  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Sistema de Monitoreo</Text>
      <Text style={styles.subtitulo}>Servidor web-01</Text>
      <Text style={styles.detalle}>10.0.2.10 · Ubuntu 24.04</Text>
    </View>
  )
}

function Paso2() {
  return (
    <View style={styles.contenedor}>
      <Image
        source={{ uri: 'https://reactnative.dev/img/tiny_logo.png' }}
        style={{ width: 80, height: 80 }}
      />
      <Text style={styles.titulo}>Conectar servidor</Text>
      <Pressable
        style={({ pressed }) => [
          styles.boton,
          pressed && styles.botonPresionado,
        ]}
        onPress={() => Alert.alert('Conectando', 'Estableciendo conexión SSH...')}
      >
        <Text style={styles.textoBoton}>Conectar SSH</Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
    gap: 16,
  },
  titulo: { fontSize: 20, fontWeight: '600' },
  subtitulo: { fontSize: 16, color: '#333' },
  detalle: { fontSize: 13, color: '#777' },
  boton: {
    backgroundColor: '#1565c0',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  botonPresionado: { backgroundColor: '#0d47a1' },
  textoBoton: { color: '#fff', fontWeight: '600', fontSize: 16 },
})

*/



// app/index.tsx
import { StyleSheet, Text, View } from 'react-native'
import { ReactNode } from 'react'


// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Props tipadas — TarjetaServidor                     │
// │  2  Paso 2  children y composición — Card reutilizable          │
// │  3  Paso 3  Props opcionales y BadgeEstado                      │
// │  4  Paso 4  ScrollView y SafeAreaView                           │
// │  5  Paso 5  Modal de confirmación                               │
// │  6  Paso 6  Pantalla completa — detalle de servidor             │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 2

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    default:
      return (
        <View style={styles.centrado}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — Props tipadas ──────────────────────────────────────────

interface TarjetaServidorProps {
  nombre: string
  ip: string
  sistema: string
  puerto: number
}

function TarjetaServidor({ nombre, ip, sistema, puerto }: TarjetaServidorProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreServidor}>{nombre}</Text>
      <Text style={styles.datoDireccion}>{ip}:{puerto}</Text>
      <Text style={styles.datoSistema}>{sistema}</Text>
    </View>
  )
}

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Inventario de servidores</Text>
      <TarjetaServidor
        nombre="web-01"
        ip="10.0.2.10"
        sistema="Ubuntu 24.04 LTS"
        puerto={22}
      />
      <TarjetaServidor
        nombre="db-primary"
        ip="10.0.2.20"
        sistema="Debian 12"
        puerto={5432}
      />
      <TarjetaServidor
        nombre="cache-01"
        ip="10.0.2.30"
        sistema="Alpine 3.19"
        puerto={6379}
      />
    </View>
  )
}

const styles = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 12,
  },
  centrado: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  encabezado: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 4,
  },
  tarjeta: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    padding: 16,
    gap: 4,
    shadowColor: '#000',
    shadowOpacity: 0.06,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 2 },
    elevation: 2,
  },
  nombreServidor: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  datoDireccion: {
    fontSize: 13,
    color: '#1565c0',
    fontFamily: 'monospace',
  },
  datoSistema: {
    fontSize: 12,
    color: '#757575',
  },
})



interface CardProps {
  titulo: string
  subtitulo?: string
  children: ReactNode
}

function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={estilos2.card}>
      <View style={estilos2.cardCabecera}>
        <Text style={estilos2.cardTitulo}>{titulo}</Text>
        {subtitulo && (
          <Text style={estilos2.cardSubtitulo}>{subtitulo}</Text>
        )}
      </View>
      <View style={estilos2.cardCuerpo}>{children}</View>
    </View>
  )
}

function FilaInfo({ etiqueta, valor }: { etiqueta: string; valor: string }) {
  return (
    <View style={estilos2.fila}>
      <Text style={estilos2.etiqueta}>{etiqueta}</Text>
      <Text style={estilos2.valor}>{valor}</Text>
    </View>
  )
}

function Paso2() {
  return (
    <View style={estilos2.fondo}>
      <Text style={estilos2.titulo}>Detalle de nodo</Text>

      <Card titulo="web-01" subtitulo="Servidor web principal">
        <FilaInfo etiqueta="IP" valor="10.0.2.10" />
        <FilaInfo etiqueta="Puerto" valor="22 (SSH)" />
        <FilaInfo etiqueta="OS" valor="Ubuntu 24.04 LTS" />
        <FilaInfo etiqueta="CPU" valor="4 vCPU · 48%" />
        <FilaInfo etiqueta="RAM" valor="8 GB · 3.1 GB usados" />
      </Card>

      <Card titulo="Conexiones activas">
        <FilaInfo etiqueta="HTTP" valor="142 req/s" />
        <FilaInfo etiqueta="SSH" valor="2 sesiones" />
        <FilaInfo etiqueta="Último acceso" valor="hace 3 minutos" />
      </Card>
    </View>
  )
}

const estilos2 = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
  },
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 12,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOpacity: 0.07,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
  },
  cardCabecera: {
    backgroundColor: '#1565c0',
    paddingHorizontal: 16,
    paddingVertical: 12,
    gap: 2,
  },
  cardTitulo: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
  },
  cardSubtitulo: {
    fontSize: 12,
    color: '#bbdefb',
  },
  cardCuerpo: {
    padding: 12,
    gap: 8,
  },
  fila: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  etiqueta: {
    fontSize: 13,
    color: '#546e7a',
    fontWeight: '500',
  },
  valor: {
    fontSize: 13,
    color: '#1a1a1a',
    fontFamily: 'monospace',
  },
})