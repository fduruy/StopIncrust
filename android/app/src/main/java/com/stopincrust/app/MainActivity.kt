package com.stopincrust.app

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.journeyapps.barcodescanner.ScanContract
import com.journeyapps.barcodescanner.ScanOptions
import kotlinx.coroutines.launch

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                Surface(modifier = Modifier.fillMaxSize()) {
                    var isAuth by remember { mutableStateOf(false) }
                    if (isAuth) HomeScreen(onSignOut = { ApiClient.setSession(null); isAuth = false }) else LoginScreen { isAuth = true }
                }
            }
        }
    }
}

@Composable
fun LoginScreen(onSignedIn: () -> Unit) {
    var phone by remember { mutableStateOf("") }
    var otp by remember { mutableStateOf("") }
    var otpSent by remember { mutableStateOf(false) }
    var error by remember { mutableStateOf<String?>(null) }
    val scope = rememberCoroutineScope()

    Column(modifier = Modifier.padding(24.dp)) {
        Text("StopIncrust", style = MaterialTheme.typography.headlineLarge)
        if (!otpSent) {
            OutlinedTextField(phone, { phone = it }, label = { Text("Phone (+336...)") })
            Button(onClick = { scope.launch { try { ApiClient.sendOtp(phone); otpSent = true } catch (e: Exception) { error = e.message } } }) { Text("Send OTP") }
        } else {
            OutlinedTextField(otp, { otp = it }, label = { Text("SMS code") })
            Button(onClick = { scope.launch { try { ApiClient.verifyOtp(phone, otp); onSignedIn() } catch (e: Exception) { error = e.message } } }) { Text("Verify") }
        }
        error?.let { Text(it, color = Color.Red) }
    }
}

@Composable
fun HomeScreen(onSignOut: () -> Unit) {
    var eventName by remember { mutableStateOf("") }
    var location by remember { mutableStateOf("") }
    var maxIncrustes by remember { mutableStateOf("0") }
    var createdEvent by remember { mutableStateOf<Event?>(null) }
    var error by remember { mutableStateOf<String?>(null) }
    var showScanner by remember { mutableStateOf(false) }
    val scope = rememberCoroutineScope()

    Column(modifier = Modifier.padding(24.dp)) {
        Text("New event (Host)", style = MaterialTheme.typography.titleLarge)
        OutlinedTextField(eventName, { eventName = it }, label = { Text("Name") })
        OutlinedTextField(location, { location = it }, label = { Text("Location") })
        OutlinedTextField(maxIncrustes, { maxIncrustes = it }, label = { Text("Max incruste/guest (0=none, empty=unlimited)") })
        Button(onClick = {
            scope.launch {
                try {
                    val max: Int? = maxIncrustes.toIntOrNull()
                    createdEvent = ApiClient.createEvent(eventName, "2026-12-24T20:00:00Z", location, if (maxIncrustes.isBlank()) null else max)
                } catch (e: Exception) { error = e.message }
            }
        }) { Text("Create event") }
        createdEvent?.let { Text("Created: ${it.name} (${it.id})") }
        error?.let { Text(it, color = Color.Red) }
        Button(onClick = { showScanner = true }) { Text("Scan mode") }
        Button(onClick = onSignOut) { Text("Sign out") }
        if (showScanner) ScannerScreen { showScanner = false }
    }
}

@Composable
fun ScannerScreen(onClose: () -> Unit) {
    var lastResult by remember { mutableStateOf<ScanResult?>(null) }
    var error by remember { mutableStateOf<String?>(null) }
    val scope = rememberCoroutineScope()
    val launcher = androidx.activity.compose.rememberLauncherForActivityResult(ScanContract()) { result ->
        val qr = result.contents ?: return@rememberLauncherForActivityResult
        scope.launch {
            try { lastResult = ApiClient.validateScan(qr) } catch (e: Exception) { error = e.message }
        }
    }

    Column(modifier = Modifier.padding(24.dp)) {
        Button(onClick = { launcher.launch(ScanOptions().setDesiredBarcodeFormats(ScanOptions.QR_CODE)) }) { Text("Scan QR") }
        lastResult?.let {
            Text(if (it.valid) "VALID ${it.type}" else "INVALID ${it.reason}", color = if (it.valid) Color.Green else Color.Red)
            it.guest?.let { g -> Text("${g.first_name} ${g.last_name}") }
        }
        error?.let { Text(it, color = Color.Red) }
        Button(onClick = onClose) { Text("Close") }
    }
}
