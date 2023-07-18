package com.danielcch.galactic_compass

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.StreamHandler
import kotlin.math.roundToInt

/**
 * Class [SensorHandler] helps get the data form sensor orientation
 */
class SensorHandler(
    private  var sensorManager: SensorManager
): StreamHandler {
    private lateinit var sensorEventListener: SensorEventListener
    private var sensor: Sensor? = null

    /**
     * Register listener for sensor stream and gets Orientation Sensor
     */
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sensor = sensorManager.getDefaultSensor(Sensor.TYPE_ORIENTATION)

        if (sensor == null) {
            events!!.error(
                "NO_SENSOR",
                "Sensor not found",
                "Device don't have required sensor",
            )
            return
        }

        sensorEventListener = createSensorEventListener(events!!)
        sensorManager.registerListener(
            sensorEventListener,
            sensor,
            SensorManager.SENSOR_DELAY_NORMAL
        )
    }

    /**
     * Disposes of sensor manager when no longer needed
     */
    override fun onCancel(arguments: Any?) {
        if (sensor != null) {
            sensorManager.unregisterListener(sensorEventListener)
        }
    }

    /**
     * Sends data when sensor receives new data
     * Data sent is rounded to rwo decimals
     */
    private fun createSensorEventListener(events: EventChannel.EventSink): SensorEventListener {
        return object : SensorEventListener {
            override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {}

            override fun onSensorChanged(event: SensorEvent) {
                val orientation = (event.values[0] * 100.0).roundToInt() / 100.0

                events.success(orientation)
            }
        }
    }
}
