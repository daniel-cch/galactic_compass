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

/// Extension on [GalacticCompassData] to get data in radians
extension ToRadians on GalacticCompassData {
  GalacticCompassData toRadians() {
    return GalacticCompassData(
      angle: _degreeToRadian(angle),
    );
  }
}

/// Function converts degree to radians
double _degreeToRadian(double degree) {
  final radians = degree * math.pi / 180;
  final asString = radians.toStringAsFixed(2);

  return double.parse(asString);
}
