package com.example.philips_remote

import dev.flutter.pigeon.Pigeon
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

  private var networkChannel: NetworkChannel? = null

  private var lifecycleHelper: Pigeon.AndroidLifecycleHelper? = null


  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    val binaryMessenger = flutterEngine.dartExecutor.binaryMessenger

    networkChannel = NetworkChannel(binaryMessenger, applicationContext)

    lifecycleHelper = LifecycleHelper(binaryMessenger, this)
  }
}
