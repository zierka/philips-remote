package com.example.philips_remote

import android.app.Activity
import dev.flutter.pigeon.Pigeon
import io.flutter.plugin.common.BinaryMessenger

class LifecycleHelper(binaryMessenger: BinaryMessenger, activity: Activity): Pigeon.AndroidLifecycleHelper {

    private val activity: Activity = activity

    init {
        Pigeon.AndroidLifecycleHelper.setup(binaryMessenger, this)
    }

    override fun sendToBackground() {
        activity.moveTaskToBack(true)
    }
}