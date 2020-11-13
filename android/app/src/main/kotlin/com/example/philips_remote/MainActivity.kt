package com.example.philips_remote

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

  private var networkChannel: NetworkChannel? = null

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    networkChannel = NetworkChannel(flutterEngine.dartExecutor.binaryMessenger, applicationContext)
  }
}
