// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.tuapp.compose.ui.S07_StateHoistingScreen
import com.tuapp.compose.ui.S08_BienvenidaScreen
import com.ute.compose.ui.S01_SaludoScreen
import com.ute.compose.ui.S03_ButtonScreen
import com.ute.compose.ui.S04_LayoutScreen
import com.ute.compose.ui.S05_ModifierScreen
import com.ute.compose.ui.material3.Paso01SumaPreview
import com.ute.compose.ui.screens.*
import com.ute.contactos.ui.Paso01_TextFieldScreen

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada paso:
                // S01_SaludoScreen()
                // S02_TextScreen()
                // S03_ButtonScreen()
                // S04_LayoutScreen()
                // S05_ModifierScreen()
                // S06_EstadoScreen()
                // S07_StateHoistingScreen()
                // S08_BienvenidaScreen()
                // Paso01_TextFieldScreen()
                Paso01SumaPreview()
                // Paso01_TextFieldScreen()
                // Paso02_CardScreen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                // Paso06_DialogosScreen()   // ← paso activo
            }
        }
    }
}