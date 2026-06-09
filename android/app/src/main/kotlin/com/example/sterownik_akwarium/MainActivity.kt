package com.example.sterownik_akwarium

import android.content.Context
import android.net.wifi.WifiManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

    private var wifiLock: WifiManager.WifiLock? = null
    private var multicastLock: WifiManager.MulticastLock? = null

    override fun onResume() {
        super.onResume()
        val wm = applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager

        // Utrzymuje radio WiFi aktywne w tle — zapobiega zrywaniu polaczenia MQTT
        // do lokalnego brokera ESP32 gdy ekran gasnie (Android domyslnie usypia WiFi
        // dla prywatnych adresow LAN szybciej niz dla polaczen internetowych).
        if (wifiLock == null) {
            @Suppress("DEPRECATION")
            wifiLock = wm.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF, "akwarium_wifi")
        }
        if (wifiLock?.isHeld == false) wifiLock?.acquire()

        // Pozwala odbierac pakiety multicast — wymagane przez multicast_dns do
        // odkrywania lokalnego brokera przez mDNS (_akwarium._tcp).
        if (multicastLock == null) {
            multicastLock = wm.createMulticastLock("akwarium_multicast")
            multicastLock?.setReferenceCounted(false)
        }
        if (multicastLock?.isHeld == false) multicastLock?.acquire()
    }

    override fun onDestroy() {
        if (wifiLock?.isHeld == true) wifiLock?.release()
        if (multicastLock?.isHeld == true) multicastLock?.release()
        super.onDestroy()
    }
}
