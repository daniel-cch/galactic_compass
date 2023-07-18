
import 'dart:async';

import 'package:flutter/services.dart';

class GalacticCompass {
  static const MethodChannel _channel = MethodChannel('galactic_compass');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
