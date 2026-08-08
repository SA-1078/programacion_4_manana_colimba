package com.ute.compose.ui.material3

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AttachMoney
import androidx.compose.material.icons.filled.ShoppingCart
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01CompraTiendaScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {

        Text(
            text = "Cálculo de Subtotal",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        CompraProducto()
    }
}

@Composable
private fun CompraProducto() {

    var nombre by remember { mutableStateOf("") }
    var cantidad by remember { mutableStateOf("") }
    var precio by remember { mutableStateOf("") }

    var subtotal by remember { mutableStateOf("") }
    var descuento by remember { mutableStateOf("") }
    var totalPagar by remember { mutableStateOf("") }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "Compra de productos",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Nombre del producto
        OutlinedTextField(
            value = nombre,
            onValueChange = { nombre = it },
            label = { Text("Nombre del Producto") },
            leadingIcon = {
                Icon(
                    Icons.Default.ShoppingCart,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Cantidad
        OutlinedTextField(
            value = cantidad,
            onValueChange = { cantidad = it },
            label = { Text("Cantidad") },
            leadingIcon = {
                Icon(
                    Icons.Default.ShoppingCart,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Precio
        OutlinedTextField(
            value = precio,
            onValueChange = { precio = it },
            label = { Text("Precio") },
            leadingIcon = {
                Icon(
                    Icons.Default.AttachMoney,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Decimal,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Botón calcular
        Button(
            onClick = {

                val cantidadInt = cantidad.toIntOrNull() ?: 0
                val precioDouble = precio.toDoubleOrNull() ?: 0.0

                val resultado = cantidadInt * precioDouble

                val porcentaje = when {
                    resultado > 50 -> 0.10
                    resultado > 20 -> 0.05
                    else -> 0.0
                }

                val valorDescuento = resultado * porcentaje
                val total = resultado - valorDescuento

                subtotal = "%.2f".format(resultado)
                descuento = "%.2f".format(valorDescuento)
                totalPagar = "%.2f".format(total)
            },
            modifier = Modifier.fillMaxWidth()
        ) {

            Text(text = "Calcular")
        }

        // Resultados
        Text(text = "Nombre del Producto: $nombre")

        Text(text = "Subtotal: $$subtotal")

        Text(text = "Descuento: $$descuento")

        Text(text = "Total a Pagar: $$totalPagar")
    }
}

@Preview(showBackground = true)
@Composable
fun CompraTiendaPreview() {

    MaterialTheme {
        Paso01CompraTiendaScreen()
    }
}