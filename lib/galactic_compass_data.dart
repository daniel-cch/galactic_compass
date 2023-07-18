import 'dart:math' as math;

/// [GalacticCompassData] represents the angle in radians given by the device
/// Android uses SensorManager with getOrientation
/// iOS uses heading sensor from CLLocation
class GalacticCompassData {
  const GalacticCompassData({
    required this.angle,
  });

  /// Represents angle in radians
  final double angle;
}

/// Extension on [GalacticCompassData] to get data in degrees
extension ToDegree on GalacticCompassData {
  GalacticCompassData toDegrees() {
    return GalacticCompassData(
      angle: _degreeToRadian(angle),
    );
  }
}

/// Function converts radians to degrees
double _degreeToRadian(double degree) {
  return degree * math.pi / 180;
}
