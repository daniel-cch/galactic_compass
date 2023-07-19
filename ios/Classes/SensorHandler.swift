import Flutter
import Foundation
import CoreLocation

/// Handles sensor data and dispatches data to flutter event
class SensorHandler: NSObject, FlutterStreamHandler, CLLocationManagerDelegate {
    private var eventSink: FlutterEventSink?;
    private let locationManager: CLLocationManager

    /// Initializes [CLLocationManager] and request location authorization
    override init() {
        locationManager = CLLocationManager()
        super.init()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    /// Start Heading update if heading available or sends error if heading not available
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events;

        if(CLLocationManager.headingAvailable()) {
            locationManager.startUpdatingHeading()
            return nil
        }

        return FlutterError(code: "NO_SENSOR", message: "Sensor not found", details: "Device don't have required sensor")
    }

    /// Disposes of [CLLocationManager] asn [FlutterEventSink] when connection is over
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        locationManager.stopUpdatingHeading()
        locationManager.delegate = nil
        eventSink = nil;

        return nil
    }

    /// Updates location and sends it to FlutterEventSink
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let orientation = round(newHeading.magneticHeading * 100) / 100
        eventSink?(orientation)
    }
}
