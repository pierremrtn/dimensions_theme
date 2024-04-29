import 'package:flutter/material.dart';

import 'dimensions_theme.dart';

class EdgeInsetsOf {
  const EdgeInsetsOf(this.context);

  final BuildContext context;

  EdgeInsets all(Object dimension) {
    return EdgeInsets.all(
      Dimensions.of(context).get(dimension),
    );
  }

  EdgeInsets only({
    Object? left,
    Object? top,
    Object? right,
    Object? bottom,
  }) {
    final theme = Dimensions.of(context);
    return EdgeInsets.only(
      left: left != null ? theme.get(left) : 0,
      top: top != null ? theme.get(top) : 0,
      right: right != null ? theme.get(right) : 0,
      bottom: bottom != null ? theme.get(bottom) : 0,
    );
  }

  EdgeInsets symmetric({
    Object? vertical,
    Object? horizontal,
  }) {
    final theme = Dimensions.of(context);
    return EdgeInsets.symmetric(
      vertical: vertical != null ? theme.get(vertical) : 0,
      horizontal: horizontal != null ? theme.get(horizontal) : 0,
    );
  }
}

extension PaddingThemeExtension on BuildContext {
  EdgeInsetsOf get padding => EdgeInsetsOf(this);
}
