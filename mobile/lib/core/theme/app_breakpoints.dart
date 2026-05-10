import 'package:flutter/material.dart';

/// Represents the layout size categories based on Material 3 guidelines.
sealed class LayoutSize {
  const LayoutSize();

  /// Compact layout (mobile phones) - width < 600
  static const LayoutSize compact = _CompactLayout();

  /// Medium layout (tablets in portrait) - 600 <= width < 840
  static const LayoutSize medium = _MediumLayout();

  /// Expanded layout (tablets in landscape / desktop) - width >= 840
  static const LayoutSize expanded = _ExpandedLayout();
}

final class _CompactLayout extends LayoutSize {
  const _CompactLayout();
}

final class _MediumLayout extends LayoutSize {
  const _MediumLayout();
}

final class _ExpandedLayout extends LayoutSize {
  const _ExpandedLayout();
}

/// Breakpoint constants following Material 3 adaptive layout guidelines.
class AppBreakpoints {
  AppBreakpoints._();

  /// Compact breakpoint - mobile phones
  static const double compact = 0;

  /// Medium breakpoint - tablets in portrait
  static const double medium = 600;

  /// Expanded breakpoint - tablets in landscape / desktop
  static const double expanded = 840;

  /// Returns the current layout size based on screen width.
  static LayoutSize of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= expanded) {
      return LayoutSize.expanded;
    } else if (width >= medium) {
      return LayoutSize.medium;
    } else {
      return LayoutSize.compact;
    }
  }

  /// Returns true if the current device is a mobile phone (compact).
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < medium;
  }

  /// Returns true if the current device is a tablet (medium).
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= medium && width < expanded;
  }

  /// Returns true if the current device is a desktop or large tablet (expanded).
  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= expanded;
  }
}