import 'package:galactic_compass/galactic_compass.dart';
import 'package:galactic_compass/galactic_compass_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class GalacticCompassPlatform extends PlatformInterface {
  GalacticCompassPlatform() : super(token: _token);

  static final Object _token = Object();
  static GalacticCompassPlatform _instance = MethodChannelGalacticCompass();

  /// The default instance of [GalacticCompassPlatform] to use.
  /// Defaults to [MethodChannelGalacticCompass].
  static GalacticCompassPlatform get instance => _instance;

  /// platform-specific class that extends [GalacticCompassPlatform] when
  /// they register themselves.
  static set instance(GalacticCompassPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Gets stream of [GalacticCompassData] from native Android and iOS implementation
  Stream<GalacticCompassData> getOrientation() {
    throw UnimplementedError('getOrientation has not been implemented.');
  }
}
