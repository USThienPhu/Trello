import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_breakpoints.dart';

/// A generic responsive value that adapts based on layout size.
///
/// Example:
/// ```dart
/// ResponsiveValue(
///   compact: AppSize.s16,
///   medium: AppSize.s24,
///   expanded: AppSize.s32,
/// ).resolve(context)
/// ```
class ResponsiveValue<T> {
  /// The value for compact layout (mobile).
  final T compact;

  /// The value for medium layout (tablet portrait).
  final T? medium;

  /// The value for expanded layout (desktop/tablet landscape).
  final T? expanded;

  const ResponsiveValue({
    required this.compact,
    this.medium,
    this.expanded,
  });

  /// Resolves the appropriate value based on the current layout size.
  T resolve(BuildContext context) {
    final layoutSize = AppBreakpoints.of(context);
    if (layoutSize == LayoutSize.expanded && expanded != null) {
      return expanded as T;
    } else if (layoutSize == LayoutSize.medium && medium != null) {
      return medium as T;
    } else {
      return compact;
    }
  }
}

/// Extension methods on [BuildContext] for responsive values.
extension ResponsiveBuildContext on BuildContext {
  /// Resolves a [ResponsiveValue] based on the current layout size.
  ///
  /// Example:
  /// ```dart
  /// context.responsive(
  ///   ResponsiveValue(
  ///     compact: AppSize.s16,
  ///     medium: AppSize.s24,
  ///     expanded: AppSize.s32,
  ///   ),
  /// )
  /// ```
  T responsive<T>(ResponsiveValue<T> value) {
    return value.resolve(this);
  }
}