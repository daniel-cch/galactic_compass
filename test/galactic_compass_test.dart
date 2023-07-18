import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:galactic_compass/galactic_compass.dart';

void main() {
  const MethodChannel channel = MethodChannel('galactic_compass');
  const EventChannel eventChannel = EventChannel(
    'com.danielcch.galactic_compass.orientation',
  );

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    eventChannel.binaryMessenger.setMockMessageHandler(
      'channel',
      (message) async => null,
    );
  });

  test('getOrientation', () async {
    expect(GalacticCompass.getOrientation(), isA<Stream>);
  });
}
