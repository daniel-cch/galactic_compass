package com.danielcch.galactic_compass

import android.content.Context
import android.hardware.SensorManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** GalacticCompassPlugin */
/**
 * Class [GalacticCompassPlugin] handles native code and sends information con event channel to dart
 */
class GalacticCompassPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var orientationChannel : EventChannel
  private lateinit var sensorHandler: SensorHandler
  private lateinit var sensorManager: SensorManager
  private var orientationChannelName: String = "com.danielcch.galactic_compass.orientation"

  /**
   * When called sets [SensorManager], creates [EventChannel] and [SensorHandler]
   */
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    sensorManager = flutterPluginBinding.applicationContext.getSystemService(Context.SENSOR_SERVICE) as SensorManager

    orientationChannel = EventChannel(flutterPluginBinding.binaryMessenger, orientationChannelName)
    sensorHandler = SensorHandler(sensorManager)
    orientationChannel.setStreamHandler(sensorHandler)
  }

  /**
   * Maps calls to specific functionality
   */
  override fun onMethodCall(call: MethodCall, result: Result) {
  }

  /**
   * Disposes channel and sensor handler
   */
  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    orientationChannel.setStreamHandler(null)
    sensorHandler.onCancel(null)
  }
}
