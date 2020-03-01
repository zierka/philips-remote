package com.example.philips_remote

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  private var networkChannel: NetworkChannel? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    networkChannel = NetworkChannel(flutterView.dartExecutor.binaryMessenger, applicationContext)
  }
}
