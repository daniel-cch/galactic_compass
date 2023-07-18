import Flutter
import UIKit

/// Registers MethodChannel and EventChannel
public class SwiftGalacticCompassPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let sensorHandler = SensorHandler()

        let channel = FlutterMethodChannel(name: "com.danielcch.galactic_compass.channel", binaryMessenger: registrar.messenger())

        let orientationChannel = FlutterEventChannel(name: "com.danielcch.galactic_compass.orientation", binaryMessenger: registrar.messenger())
        orientationChannel.setStreamHandler(sensorHandler)

        let instance = SwiftGalacticCompassPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    }
}
