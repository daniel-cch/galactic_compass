import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:galactic_compass/galactic_compass.dart';
import 'package:galactic_compass/galactic_compass_platform_interface.dart';

/// An implementation of [GalacticCompassPlatform] that uses method channels.
class MethodChannelGalacticCompass extends GalacticCompassPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(
    'com.danielcch.galactic_compass.channel',
  );
  @visibleForTesting
  final orientationEvent = const EventChannel(
    'com.danielcch.galactic_compass.orientation',
  );

  /// Gets stream of [GalacticCompassData] from native Android and iOS implementation
  @override
  Stream<GalacticCompassData> getOrientation() {
    final stream = orientationEvent.receiveBroadcastStream().map(
          (event) => GalacticCompassData(angle: event as double),
        );

    return stream;
  }
}
