import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


class Flutterem {
  static const MethodChannel _channel =
      const MethodChannel('flutterem');

  static Size _size;

  static double _targetWidth;
  static double _targetHeight;

  static init({double targetWidth, double targetHeight}) async {
      _size = await _displaySize;
      _targetWidth = targetWidth;
      _targetHeight = targetHeight;
  }

  static Size get size => _size;

  static double get targetWidth => _targetWidth;

  static double get targetHeight => _targetHeight;

  static Future<Size> get _displaySize async {
    Map<dynamic, dynamic> result = await _channel.invokeMethod('getDisplaySize');
    double width = result["width"];
    double height = result["height"];
    return Size(min(width, height), max(width, height));
  }
}

double sw(double value)  => value * Flutterem._size.width / Flutterem._targetWidth;

double sh(double value)  => value * Flutterem._size.height / Flutterem._targetHeight;


