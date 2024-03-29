import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Flutterem {
  static const MethodChannel _channel = const MethodChannel('flutterem');

  static Size _size;

  static bool _enabled = true;

  static double _targetWidth;
  static double _targetHeight;

  static init({double targetWidth, double targetHeight}) async {
    _size = await displaySize;
    _targetWidth = targetWidth;
    _targetHeight = targetHeight;
  }

  static set enabled(bool enabled) {
    _enabled = enabled;
  }

  static double get targetWidth => _targetWidth;

  static double get targetHeight => _targetHeight;

  static Future<Size> get displaySize async {
    Map<dynamic, dynamic> result = await _channel.invokeMethod('getDisplaySize');
    double width = result["width"];
    double height = result["height"];
    return Size(min(width, height), max(width, height));
  }
}

double sw(double value) =>
    Flutterem._enabled ? value * Flutterem._size.width / Flutterem._targetWidth : value;

double sh(double value) =>
    Flutterem._enabled ? value * Flutterem._size.height / Flutterem._targetHeight : value;
