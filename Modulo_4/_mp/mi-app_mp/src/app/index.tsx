import { ReactNode } from 'react';
import { StyleSheet, Text, View } from 'react-native';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Venta de Equipos Móviles - mi-app_mp                            │
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Props tipadas — TarjetaSmartphone                    │
// │  2  Paso 2  children y composición — Card reutilizable          │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 1;

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />;
    case 2:
      return <Paso2 />;
    default:
      return (
        <View style={styles.centrado}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      );
  }
}

// ─── Paso 1 — Props tipadas ──────────────────────────────────────────

interface TarjetaSmartphoneProps {
  modelo: string;
  marca: string;
  pantalla: string;
  precio: number;
}

function TarjetaSmartphone({ modelo, marca, pantalla, precio }: TarjetaSmartphoneProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreServidor}>{marca} {modelo}</Text>
      <Text style={styles.datoDireccion}>{pantalla}</Text>
      <Text style={styles.datoSistema}>${precio} USD</Text>
    </View>
  );
}

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Inventario de Smartphones</Text>
      <TarjetaSmartphone modelo="Galaxy S24 Ultra" marca="Samsung" pantalla="6.8 Amoled 120Hz" precio={1299} />
      <TarjetaSmartphone modelo="iPhone 15 Pro Max" marca="Apple" pantalla="6.7 Super Retina XDR" precio={1399} />
      <TarjetaSmartphone modelo="14 Ultra" marca="Xiaomi" pantalla="6.73 LTPO Amoled" precio={1199} />
    </View>
  );
}

interface CardProps {
  titulo: string;
  subtitulo?: string;
  children: ReactNode;
}

function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={estilos2.card}>
      <View style={estilos2.cardCabecera}>
        <Text style={estilos2.cardTitulo}>{titulo}</Text>
        {subtitulo && <Text style={estilos2.cardSubtitulo}>{subtitulo}</Text>}
      </View>
      <View style={estilos2.cardCuerpo}>{children}</View>
    </View>
  );
}

function FilaInfo({ etiqueta, valor }: { etiqueta: string; valor: string }) {
  return (
    <View style={estilos2.fila}>
      <Text style={estilos2.etiqueta}>{etiqueta}</Text>
      <Text style={estilos2.valor}>{valor}</Text>
    </View>
  );
}

function Paso2() {
  return (
    <View style={estilos2.fondo}>
      <Text style={estilos2.titulo}>Detalle de Smartphone</Text>

      <Card titulo="Galaxy S24 Ultra" subtitulo="Flagship Samsung 2024">
        <FilaInfo etiqueta="Pantalla" valor="6.8 Dynamic AMOLED 2X" />
        <FilaInfo etiqueta="Cámara" valor="200 MP + Telefoto 50 MP" />
        <FilaInfo etiqueta="Almacenamiento" valor="512 GB" />
        <FilaInfo etiqueta="RAM" valor="12 GB" />
        <FilaInfo etiqueta="Precio" valor="$1,299 USD" />
      </Card>

      <Card titulo="Ventas Recientes">
        <FilaInfo etiqueta="Unidades Vendidas" valor="28 este mes" />
        <FilaInfo etiqueta="Stock en Bodega" valor="15 disponibles" />
        <FilaInfo etiqueta="Garantía" valor="12 meses" />
      </Card>
    </View>
  );
}

const styles = StyleSheet.create({
  fondo: { flex: 1, backgroundColor: '#f0f4f8', padding: 20, paddingTop: 60, gap: 12 },
  centrado: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  encabezado: { fontSize: 20, fontWeight: '700', color: '#1a237e', marginBottom: 4 },
  tarjeta: { backgroundColor: '#ffffff', borderRadius: 10, padding: 16, gap: 4, elevation: 2 },
  nombreServidor: { fontSize: 16, fontWeight: '600', color: '#1a1a1a' },
  datoDireccion: { fontSize: 13, color: '#1565c0' },
  datoSistema: { fontSize: 13, color: '#2e7d32', fontWeight: '700' },
});

const estilos2 = StyleSheet.create({
  fondo: { flex: 1, backgroundColor: '#f0f4f8', padding: 20, paddingTop: 60, gap: 16 },
  titulo: { fontSize: 20, fontWeight: '700', color: '#1a237e' },
  card: { backgroundColor: '#ffffff', borderRadius: 12, overflow: 'hidden', elevation: 3 },
  cardCabecera: { backgroundColor: '#1565c0', paddingHorizontal: 16, paddingVertical: 12, gap: 2 },
  cardTitulo: { fontSize: 16, fontWeight: '700', color: '#ffffff' },
  cardSubtitulo: { fontSize: 12, color: '#bbdefb' },
  cardCuerpo: { padding: 12, gap: 8 },
  fila: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' },
  etiqueta: { fontSize: 13, color: '#546e7a', fontWeight: '500' },
  valor: { fontSize: 13, color: '#1a1a1a', fontWeight: '600' },
});
