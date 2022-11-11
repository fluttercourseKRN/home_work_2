package com.kron.stats.kron_system_stats

import android.os.Build
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** KronSystemStatsPlugin */
class KronSystemStatsPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kron_system_stats")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")

    } else if(call.method == "getPlatformStats"){

      result.success(listOf(
        mapOf("Android" to android.os.Build.VERSION.RELEASE),
        mapOf("MANUFACTURER" to android.os.Build.MANUFACTURER),
        mapOf("MODEL" to android.os.Build.MODEL),
        mapOf("BRAND" to android.os.Build.BRAND),
        mapOf("DEVICE" to android.os.Build.DEVICE),
        mapOf("BOARD" to android.os.Build.BOARD),
        mapOf("ID" to android.os.Build.ID),
        mapOf("BOOTLOADER" to android.os.Build.BOOTLOADER),
        mapOf("HARDWARE" to android.os.Build.HARDWARE),
        mapOf("HOST" to android.os.Build.HOST),
        mapOf("PRODUCT" to android.os.Build.PRODUCT),
        mapOf("USER" to android.os.Build.USER),
      )
      );
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
