import { useState, type ReactNode } from 'react';
import {
  Modal,
  Pressable,
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Venta de Equipos Móviles - Componentes React Native             │
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Props tipadas — TarjetaSmartphone                    │
// │  2  Paso 2  children y composición — Card reutilizable          │
// │  3  Paso 3  Props opcionales y BadgeEstado                      │
// │  4  Paso 4  ScrollView y SafeAreaView — Catálogo Smartphones   │
// │  5  Paso 5  Modal de confirmación de reserva                     │
// │  6  Paso 6  Pantalla completa — Detalle de Equipo Móvil          │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 1;

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />;
    case 2:
      return <Paso2 />;
    case 3:
      return <Paso3 />;
    case 4:
      return <Paso4 />;
    case 5:
      return <Paso5 />;
    case 6:
      return <Paso6 />;
    default:
      return (
        <View style={estilosBase.centrado}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      );
  }
}

// ═══════════════════════════════════════════════════════════════════
// COMPONENTES COMPARTIDOS (Venta de Equipos Móviles)
// ═══════════════════════════════════════════════════════════════════

interface CardProps {
  titulo: string;
  subtitulo?: string;
  children: ReactNode;
}

function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={estilosCard.card}>
      <View style={estilosCard.cardCabecera}>
        <Text style={estilosCard.cardTitulo}>{titulo}</Text>
        {subtitulo && <Text style={estilosCard.cardSubtitulo}>{subtitulo}</Text>}
      </View>
      <View style={estilosCard.cardCuerpo}>{children}</View>
    </View>
  );
}

function FilaInfo({ etiqueta, valor }: { etiqueta: string; valor: string }) {
  return (
    <View style={estilosCard.fila}>
      <Text style={estilosCard.etiqueta}>{etiqueta}</Text>
      <Text style={estilosCard.valor}>{valor}</Text>
    </View>
  );
}

type EstadoStock = 'disponible' | 'pocas_unidades' | 'agotado' | 'preventa';

const COLOR_ESTADO: Record<EstadoStock, { fondo: string; texto: string }> = {
  disponible: { fondo: '#e8f5e9', texto: '#2e7d32' },
  pocas_unidades: { fondo: '#fff8e1', texto: '#f57f17' },
  agotado: { fondo: '#fce4ec', texto: '#c62828' },
  preventa: { fondo: '#e3f2fd', texto: '#1565c0' },
};

const ICONO_ESTADO: Record<EstadoStock, string> = {
  disponible: '●',
  pocas_unidades: '◐',
  agotado: '✕',
  preventa: '★',
};

function BadgeEstado({
  estado,
  tamaño = 12,
  mostrarIcono = false,
}: {
  estado: EstadoStock;
  tamaño?: number;
  mostrarIcono?: boolean;
}) {
  const colores = COLOR_ESTADO[estado];

  return (
    <View style={[estilosBase.badge, { backgroundColor: colores.fondo }]}>
      {mostrarIcono && (
        <Text style={{ color: colores.texto, fontSize: tamaño, fontWeight: '700' }}>
          {ICONO_ESTADO[estado]}{' '}
        </Text>
      )}
      <Text style={{ color: colores.texto, fontSize: tamaño, fontWeight: '600' }}>
        {estado.replace('_', ' ').toUpperCase()}
      </Text>
    </View>
  );
}

function ModalConfirm({
  visible,
  titulo,
  mensaje,
  etiquetaConfirmar = 'Confirmar',
  etiquetaCancelar = 'Cancelar',
  onConfirmar,
  onCancelar,
}: {
  visible: boolean;
  titulo: string;
  mensaje: string;
  etiquetaConfirmar?: string;
  etiquetaCancelar?: string;
  onConfirmar: () => void;
  onCancelar: () => void;
}) {
  return (
    <Modal visible={visible} transparent animationType="fade" onRequestClose={onCancelar}>
      <Pressable style={estilosModal.fondo} onPress={onCancelar}>
        <Pressable style={estilosModal.dialogo} onPress={() => {}}>
          <Text style={estilosModal.titulo}>{titulo}</Text>
          <Text style={estilosModal.mensaje}>{mensaje}</Text>
          <View style={estilosModal.botones}>
            <Pressable style={[estilosModal.btn, estilosModal.btnCancelar]} onPress={onCancelar}>
              <Text style={estilosModal.txtCancelar}>{etiquetaCancelar}</Text>
            </Pressable>
            <Pressable style={[estilosModal.btn, estilosModal.btnConfirmar]} onPress={onConfirmar}>
              <Text style={estilosModal.txtConfirmar}>{etiquetaConfirmar}</Text>
            </Pressable>
          </View>
        </Pressable>
      </Pressable>
    </Modal>
  );
}

// ═══════════════════════════════════════════════════════════════════
// PASO 1 — Props tipadas (TarjetaSmartphone)
// ═══════════════════════════════════════════════════════════════════

interface TarjetaSmartphoneProps {
  modelo: string;
  marca: string;
  pantalla: string;
  precio: number;
}

function TarjetaSmartphone({ modelo, marca, pantalla, precio }: TarjetaSmartphoneProps) {
  return (
    <View style={estilos1.tarjeta}>
      <Text style={estilos1.nombreEquipo}>{marca} {modelo}</Text>
      <Text style={estilos1.datoPantalla}>{pantalla}</Text>
      <Text style={estilos1.datoPrecio}>${precio.toLocaleString()} USD</Text>
    </View>
  );
}

function Paso1() {
  return (
    <View style={estilos1.fondo}>
      <Text style={estilos1.encabezado}>📱 Catalogo de Equipos Móviles</Text>
      <TarjetaSmartphone modelo="S24 Ultra" marca="Samsung" pantalla="6.8 Amoled 120Hz" precio={1299} />
      <TarjetaSmartphone modelo="15 Pro Max" marca="Apple" pantalla="6.7 Super Retina XDR" precio={1399} />
      <TarjetaSmartphone modelo="14 Ultra" marca="Xiaomi" pantalla="6.73 LTPO Amoled" precio={1199} />
    </View>
  );
}

// ═══════════════════════════════════════════════════════════════════
// PASO 2 — children y composición
// ═══════════════════════════════════════════════════════════════════

function Paso2() {
  return (
    <View style={estilos2.fondo}>
      <Text style={estilos2.titulo}>Detalle de Smartphone</Text>
      <Card titulo="Samsung Galaxy S24 Ultra" subtitulo="Smartphone Flagship Premium">
        <FilaInfo etiqueta="Marca" valor="Samsung" />
        <FilaInfo etiqueta="Almacenamiento" valor="512 GB NVMe" />
        <FilaInfo etiqueta="RAM" valor="12 GB LPDDR5X" />
        <FilaInfo etiqueta="Cámara" valor="200 MP + 50 MP Tele" />
        <FilaInfo etiqueta="Batería" valor="5000 mAh (45W)" />
        <FilaInfo etiqueta="Precio" valor="$1,299 USD" />
      </Card>
      <Card titulo="Garantía y Servicios">
        <FilaInfo etiqueta="Garantía" valor="12 meses oficial" />
        <FilaInfo etiqueta="Seguro contra robo" valor="Incluido (1 año)" />
        <FilaInfo etiqueta="Estado" valor="Disponible en tienda" />
      </Card>
    </View>
  );
}

// ═══════════════════════════════════════════════════════════════════
// PASO 3 — Props opcionales y BadgeEstado
// ═══════════════════════════════════════════════════════════════════

interface FilaSmartphoneProps {
  modelo: string;
  marca: string;
  estado: EstadoStock;
  descuento?: number;
  precio: number;
}

function FilaSmartphone({ modelo, marca, estado, descuento, precio }: FilaSmartphoneProps) {
  const precioFinal = descuento ? precio * (1 - descuento / 100) : precio;

  return (
    <View style={estilos3.fila}>
      <View style={{ gap: 2 }}>
        <Text style={estilos3.nombreEquipo}>{marca} {modelo}</Text>
        <Text style={estilos3.precioTexto}>
          ${precioFinal.toFixed(0)} USD {descuento ? `(-${descuento}%)` : ''}
        </Text>
      </View>
      <View style={{ alignItems: 'flex-end', gap: 4 }}>
        <BadgeEstado estado={estado} mostrarIcono tamaño={11} />
      </View>
    </View>
  );
}

function Paso3() {
  return (
    <View style={estilos3.fondo}>
      <Text style={estilos3.titulo}>Inventario de Celulares</Text>
      <FilaSmartphone marca="Samsung" modelo="Galaxy S24 Ultra" estado="disponible" descuento={10} precio={1299} />
      <FilaSmartphone marca="Apple" modelo="iPhone 15 Pro Max" estado="pocas_unidades" precio={1399} />
      <FilaSmartphone marca="Xiaomi" modelo="14 Ultra" estado="disponible" descuento={15} precio={1199} />
      <FilaSmartphone marca="Google" modelo="Pixel 8 Pro" estado="preventa" precio={899} />
      <FilaSmartphone marca="Motorola" modelo="Edge 50 Ultra" estado="agotado" precio={799} />
    </View>
  );
}

// ═══════════════════════════════════════════════════════════════════
// PASO 4 — ScrollView y SafeAreaView (Catálogo Móvil)
// ═══════════════════════════════════════════════════════════════════

const SMARTPHONES_DEMO = [
  { id: '1', marca: 'Samsung', modelo: 'Galaxy S24 Ultra', ram: '12GB', rom: '512GB', bateriaPct: 100, stock: 15 },
  { id: '2', marca: 'Apple', modelo: 'iPhone 15 Pro Max', ram: '8GB', rom: '256GB', bateriaPct: 100, stock: 8 },
  { id: '3', marca: 'Xiaomi', modelo: '14 Ultra', ram: '16GB', rom: '512GB', bateriaPct: 98, stock: 12 },
  { id: '4', marca: 'Google', modelo: 'Pixel 8 Pro', ram: '12GB', rom: '128GB', bateriaPct: 95, stock: 20 },
  { id: '5', marca: 'Motorola', modelo: 'Edge 50 Ultra', ram: '16GB', rom: '1TB', bateriaPct: 90, stock: 5 },
  { id: '6', marca: 'OnePlus', modelo: '12 5G', ram: '16GB', rom: '512GB', bateriaPct: 88, stock: 10 },
  { id: '7', marca: 'Asus', modelo: 'ROG Phone 8 Pro', ram: '24GB', rom: '1TB', bateriaPct: 85, stock: 3 },
  { id: '8', marca: 'Sony', modelo: 'Xperia 1 VI', ram: '12GB', rom: '256GB', bateriaPct: 92, stock: 6 },
];

function BarraStock({ unidades, etiqueta }: { unidades: number; etiqueta: string }) {
  const pct = Math.min(100, (unidades / 25) * 100);
  const color = unidades < 5 ? '#c62828' : unidades < 10 ? '#f57f17' : '#2e7d32';

  return (
    <View style={estilos4.barraFila}>
      <Text style={estilos4.barraEtiqueta}>{etiqueta}</Text>
      <View style={estilos4.barraFondo}>
        <View style={[estilos4.barraRelleno, { width: `${pct}%` as any, backgroundColor: color }]} />
      </View>
      <Text style={[estilos4.barraPct, { color }]}>{unidades} un.</Text>
    </View>
  );
}

function TarjetaEquipoNodo({ marca, modelo, ram, rom, stock }: (typeof SMARTPHONES_DEMO)[0]) {
  return (
    <View style={estilos4.nodo}>
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'baseline' }}>
        <Text style={estilos4.nodoNombre}>{marca} {modelo}</Text>
        <Text style={estilos4.nodoSpec}>{ram} / {rom}</Text>
      </View>
      <BarraStock unidades={stock} etiqueta="Stock" />
    </View>
  );
}

function Paso4() {
  return (
    <SafeAreaView style={estilos4.safeArea}>
      <View style={estilos4.header}>
        <Text style={estilos4.headerTitulo}>📱 Catálogo General de Celulares</Text>
        <Text style={estilos4.headerSub}>{SMARTPHONES_DEMO.length} modelos en tienda</Text>
      </View>
      <ScrollView
        style={estilos4.scroll}
        contentContainerStyle={estilos4.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {SMARTPHONES_DEMO.map((eq) => (
          <TarjetaEquipoNodo key={eq.id} {...eq} />
        ))}
      </ScrollView>
    </SafeAreaView>
  );
}

// ═══════════════════════════════════════════════════════════════════
// PASO 5 — Modal de confirmación de reserva
// ═══════════════════════════════════════════════════════════════════

function Paso5() {
  const [modalVisible, setModalVisible] = useState(false);
  const [reservaConfirmada, setReservaConfirmada] = useState<string | null>(null);

  return (
    <SafeAreaView style={estilos5.safeArea}>
      <Text style={estilos5.titulo}>Reserva de Smartphone</Text>
      <Text style={estilos5.subtitulo}>Samsung Galaxy S24 Ultra · $1,299 USD</Text>
      <View>
        <Pressable
          style={estilos5.botonAccion}
          onPress={() => {
            setReservaConfirmada(null);
            setModalVisible(true);
          }}
        >
          <Text style={estilos5.textoAccion}>Reservar equipo ahora</Text>
        </Pressable>
      </View>
      {reservaConfirmada && (
        <View style={estilos5.resultado}>
          <Text style={estilos5.textoResultado}>{reservaConfirmada}</Text>
        </View>
      )}
      <ModalConfirm
        visible={modalVisible}
        titulo="Confirmar Reserva de Equipo"
        mensaje={`¿Deseas confirmar la reserva del Samsung Galaxy S24 Ultra?
Se guardará 1 unidad en sucursal por 24 horas.`}
        etiquetaConfirmar="Reservar"
        onConfirmar={() => {
          setModalVisible(false);
          setReservaConfirmada(
            '✅ Reserva realizada con éxito a las ' + new Date().toLocaleTimeString(),
          );
        }}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  );
}

// ═══════════════════════════════════════════════════════════════════
// PASO 6 — Pantalla completa de detalle y gestión de ventas
// ═══════════════════════════════════════════════════════════════════

function BotonAccion({ etiqueta, color, onPress }: { etiqueta: string; color: string; onPress: () => void }) {
  return (
    <Pressable
      style={({ pressed }) => [
        estilos6.botonAccion,
        { backgroundColor: color },
        pressed && { opacity: 0.75 },
      ]}
      onPress={onPress}
    >
      <Text style={estilos6.textoBotonAccion}>{etiqueta}</Text>
    </Pressable>
  );
}

function Paso6() {
  const [modalVisible, setModalVisible] = useState(false);
  const [accionPendiente, setAccionPendiente] = useState<string>('');
  const [log, setLog] = useState<string[]>([]);

  function pedirConfirmacion(accion: string) {
    setAccionPendiente(accion);
    setModalVisible(true);
  }

  function ejecutarAccion() {
    const entrada = `[${new Date().toLocaleTimeString()}] ${accionPendiente} procesado para Samsung Galaxy S24 Ultra`;
    setLog((prev) => [entrada, ...prev]);
    setModalVisible(false);
  }

  return (
    <SafeAreaView style={estilos6.safeArea}>
      <View style={estilos6.cabecera}>
        <View>
          <Text style={estilos6.cabNombre}>Samsung Galaxy S24 Ultra</Text>
          <Text style={estilos6.cabIp}>512GB · 12GB RAM · Titanium Black</Text>
        </View>
        <BadgeEstado estado="disponible" mostrarIcono tamaño={12} />
      </View>

      <ScrollView contentContainerStyle={estilos6.scrollContenido} showsVerticalScrollIndicator={false}>
        <Card titulo="Ficha Técnica & Estado de Stock" subtitulo="Última actualización de tienda: Hoy">
          <FilaInfo etiqueta="Pantalla" valor="6.8 Dynamic AMOLED 2X 120Hz" />
          <FilaInfo etiqueta="Procesador" valor="Snapdragon 8 Gen 3 for Galaxy" />
          <FilaInfo etiqueta="Batería" valor="5000 mAh · Carga 45W" />
          <FilaInfo etiqueta="Disponibles" valor="15 unidades en Bodega Central" />
          <FilaInfo etiqueta="Precio Oficial" valor="$1,299 USD" />
        </Card>
        <Card titulo="Garantía y Despacho">
          <FilaInfo etiqueta="Cobertura" valor="12 meses garantía oficial" />
          <FilaInfo etiqueta="Envío Gratis" valor="Despacho en 24h a todo el país" />
          <FilaInfo etiqueta="Devolución" valor="30 días sin costo" />
        </Card>
        <Card titulo="Acciones Comerciales">
          <View style={estilos6.gridAcciones}>
            <BotonAccion etiqueta="Comprar" color="#2e7d32" onPress={() => pedirConfirmacion('Compra Inmediata')} />
            <BotonAccion etiqueta="Reservar" color="#1565c0" onPress={() => pedirConfirmacion('Reserva 24h')} />
            <BotonAccion etiqueta="Garantía Extendida" color="#6a1b9a" onPress={() => pedirConfirmacion('Añadir Garantía')} />
            <BotonAccion
              etiqueta="Ficha PDF"
              color="#d81b60"
              onPress={() => pedirConfirmacion('Descarga Ficha Técnica')}
            />
          </View>
        </Card>
        {log.length > 0 && (
          <Card titulo="Historial de Ventas y Reservas">
            {log.map((e, i) => (
              <Text key={i} style={estilos6.entradaLog}>
                {e}
              </Text>
            ))}
          </Card>
        )}
      </ScrollView>

      <ModalConfirm
        visible={modalVisible}
        titulo={`Confirmar: ${accionPendiente}`}
        mensaje={`¿Deseas ejecutar "${accionPendiente}" para Galaxy S24 Ultra?
Esta acción actualizará el stock.`}
        etiquetaConfirmar="Confirmar"
        onConfirmar={ejecutarAccion}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  );
}

// ═══════════════════════════════════════════════════════════════════
// ESTILOS DE VENTA DE EQUIPOS MÓVILES
// ═══════════════════════════════════════════════════════════════════

const estilosBase = StyleSheet.create({
  centrado: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 4,
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
});

const estilosCard = StyleSheet.create({
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
  cardCabecera: { backgroundColor: '#1565c0', paddingHorizontal: 16, paddingVertical: 12, gap: 2 },
  cardTitulo: { fontSize: 16, fontWeight: '700', color: '#ffffff' },
  cardSubtitulo: { fontSize: 12, color: '#bbdefb' },
  cardCuerpo: { padding: 12, gap: 8 },
  fila: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' },
  etiqueta: { fontSize: 13, color: '#546e7a', fontWeight: '500' },
  valor: { fontSize: 13, color: '#1a1a1a', fontWeight: '600' },
});

const estilosModal = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.55)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  dialogo: {
    backgroundColor: '#ffffff',
    borderRadius: 16,
    padding: 24,
    width: '85%',
    gap: 12,
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 12,
    shadowOffset: { width: 0, height: 6 },
    elevation: 10,
  },
  titulo: { fontSize: 17, fontWeight: '700', color: '#1a1a1a' },
  mensaje: { fontSize: 14, color: '#546e7a', lineHeight: 20 },
  botones: { flexDirection: 'row', gap: 10, marginTop: 4 },
  btn: { flex: 1, borderRadius: 8, paddingVertical: 12, alignItems: 'center' },
  btnCancelar: { backgroundColor: '#f5f5f5' },
  btnConfirmar: { backgroundColor: '#2e7d32' },
  txtCancelar: { color: '#424242', fontWeight: '600', fontSize: 14 },
  txtConfirmar: { color: '#ffffff', fontWeight: '700', fontSize: 14 },
});

const estilos1 = StyleSheet.create({
  fondo: { flex: 1, backgroundColor: '#f0f4f8', padding: 20, paddingTop: 60, gap: 12 },
  encabezado: { fontSize: 20, fontWeight: '700', color: '#1a237e', marginBottom: 4 },
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
  nombreEquipo: { fontSize: 16, fontWeight: '600', color: '#1a1a1a' },
  datoPantalla: { fontSize: 13, color: '#1565c0' },
  datoPrecio: { fontSize: 14, color: '#2e7d32', fontWeight: '700' },
});

const estilos2 = StyleSheet.create({
  fondo: { flex: 1, backgroundColor: '#f0f4f8', padding: 20, paddingTop: 60, gap: 16 },
  titulo: { fontSize: 20, fontWeight: '700', color: '#1a237e' },
});

const estilos3 = StyleSheet.create({
  fondo: { flex: 1, backgroundColor: '#f0f4f8', padding: 20, paddingTop: 60, gap: 8 },
  titulo: { fontSize: 20, fontWeight: '700', color: '#1a237e', marginBottom: 8 },
  fila: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    paddingHorizontal: 16,
    paddingVertical: 14,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOpacity: 0.05,
    shadowRadius: 3,
    shadowOffset: { width: 0, height: 1 },
    elevation: 1,
  },
  nombreEquipo: { fontSize: 14, fontWeight: '600', color: '#1a1a1a' },
  precioTexto: { fontSize: 12, color: '#2e7d32', fontWeight: '700' },
});

const estilos4 = StyleSheet.create({
  safeArea: { flex: 1, backgroundColor: '#0d1b2a' },
  header: {
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#1c2e40',
  },
  headerTitulo: { fontSize: 20, fontWeight: '700', color: '#e3f2fd' },
  headerSub: { fontSize: 12, color: '#78909c', marginTop: 2 },
  scroll: { flex: 1 },
  scrollContenido: { padding: 16, gap: 10, paddingBottom: 40 },
  nodo: { backgroundColor: '#132232', borderRadius: 10, padding: 14, gap: 8, borderWidth: 1, borderColor: '#1c3548' },
  nodoNombre: { fontSize: 14, fontWeight: '700', color: '#e3f2fd' },
  nodoSpec: { fontSize: 12, color: '#4fc3f7' },
  barraFila: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  barraEtiqueta: { fontSize: 11, color: '#78909c', width: 36 },
  barraFondo: { flex: 1, height: 6, backgroundColor: '#1c3548', borderRadius: 3, overflow: 'hidden' },
  barraRelleno: { height: '100%', borderRadius: 3 },
  barraPct: { fontSize: 11, fontWeight: '600', width: 44, textAlign: 'right' },
});

const estilos5 = StyleSheet.create({
  safeArea: { flex: 1, backgroundColor: '#f0f4f8', padding: 24, paddingTop: 60 },
  titulo: { fontSize: 22, fontWeight: '700', color: '#1a237e' },
  subtitulo: { fontSize: 14, color: '#546e7a', marginTop: 4, marginBottom: 32 },
  botonAccion: { backgroundColor: '#2e7d32', borderRadius: 10, paddingVertical: 14, alignItems: 'center' },
  textoAccion: { color: '#fff', fontWeight: '700', fontSize: 15 },
  resultado: { marginTop: 24, backgroundColor: '#e8f5e9', borderRadius: 8, padding: 14 },
  textoResultado: { color: '#2e7d32', fontSize: 13, fontWeight: '600' },
});

const estilos6 = StyleSheet.create({
  safeArea: { flex: 1, backgroundColor: '#f0f4f8' },
  cabecera: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 14,
    backgroundColor: '#ffffff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e7ef',
  },
  cabNombre: { fontSize: 18, fontWeight: '700', color: '#1a237e' },
  cabIp: { fontSize: 12, color: '#78909c', marginTop: 2 },
  scrollContenido: { padding: 16, gap: 14, paddingBottom: 40 },
  gridAcciones: { flexDirection: 'row', flexWrap: 'wrap', gap: 10 },
  botonAccion: { borderRadius: 8, paddingVertical: 10, paddingHorizontal: 16, minWidth: '45%', alignItems: 'center' },
  textoBotonAccion: { color: '#ffffff', fontWeight: '600', fontSize: 14 },
  entradaLog: { fontSize: 11, color: '#2e7d32', lineHeight: 18 },
});
