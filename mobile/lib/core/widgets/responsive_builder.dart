import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_breakpoints.dart';

/// A widget that rebuilds based on layout size constraints.
///
/// Uses [LayoutBuilder] to work inside constrained widgets.
class ResponsiveBuilder extends StatelessWidget {
  /// Builder function with layout size and constraints.
  final Widget Function(BuildContext context, LayoutSize layoutSize, BoxConstraints constraints) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final LayoutSize layoutSize;
        if (width >= AppBreakpoints.expanded) {
          layoutSize = LayoutSize.expanded;
        } else if (width >= AppBreakpoints.medium) {
          layoutSize = LayoutSize.medium;
        } else {
          layoutSize = LayoutSize.compact;
        }
        return builder(context, layoutSize, constraints);
      },
    );
  }
}

/// A simpler responsive widget with named builders for each layout size.
///
/// Optional builders fall back to compact if not provided.
class ResponsiveWidget extends StatelessWidget {
  /// Builder for compact layout (mobile).
  final Widget Function(BuildContext context) compact;

  /// Builder for medium layout (tablet portrait). Optional, falls back to compact.
  final Widget Function(BuildContext context)? medium;

  /// Builder for expanded layout (desktop). Optional, falls back to compact.
  final Widget Function(BuildContext context)? expanded;

  const ResponsiveWidget({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final LayoutSize layoutSize;
        if (width >= AppBreakpoints.expanded) {
          layoutSize = LayoutSize.expanded;
        } else if (width >= AppBreakpoints.medium) {
          layoutSize = LayoutSize.medium;
        } else {
          layoutSize = LayoutSize.compact;
        }

        return switch (layoutSize) {
          LayoutSize.compact => compact(context),
          LayoutSize.medium => (medium ?? compact)(context),
          LayoutSize.expanded => (expanded ?? medium ?? compact)(context),
        };
      },
    );
  }
}