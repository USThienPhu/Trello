import 'package:flutter/material.dart';

/// Singleton that stores device dimensions and calculates scales.
///
/// Initialize once in MyApp.build() with DeviceValue.initialize(context)
/// Then use anywhere without passing context.
class DeviceValue {
  DeviceValue._();

  static final DeviceValue instance = DeviceValue._();

  /// Baseline dimensions (iPhone 13)
  static const double baselineWidth = 390.0;
  static const double baselineHeight = 844.0;

  /// Current device dimensions
  double deviceWidth = 0;
  double deviceHeight = 0;

  /// Calculated scales
  double widthScale = 1.0;
  double heightScale = 1.0;
  double avgScale = 1.0;

  /// Is initialized
  bool _initialized = false;
  bool get isInitialized => _initialized;

  /// Initialize with MediaQuery from MyApp.build()
  void initialize(BuildContext context) {
    if (_initialized) return;

    final size = MediaQuery.sizeOf(context);
    deviceWidth = size.width;
    deviceHeight = size.height;

    widthScale = deviceWidth / baselineWidth;
    heightScale = deviceHeight / baselineHeight;
    avgScale = ((widthScale + heightScale) / 2).clamp(1.0, 1.3);

    _initialized = true;
  }

  /// Scale a value proportionally
  double scale(double value) => value * avgScale;

  /// Get proportional size: value × avgScale
  static double get(double value) => instance.scale(value);

  /// Get percentage of device width (e.g., percent80 = 0.8 × deviceWidth)
  static double percent(double percent) => instance.deviceWidth * percent;
}