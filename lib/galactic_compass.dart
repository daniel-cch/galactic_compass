import 'package:galactic_compass/galactic_compass_data.dart';
import 'package:galactic_compass/galactic_compass_platform_interface.dart';

export 'galactic_compass_data.dart';

/// Class to access Compass platform implementations
class GalacticCompass {
  /// Gets stream of [GalacticCompassData] from native Android and iOS implementation
  static Stream<GalacticCompassData> getOrientation() {
    return GalacticCompassPlatform.instance.getOrientation();
  }
}
