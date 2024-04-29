import 'package:dimensions_theme/src/dimensions_theme.dart';
import 'package:flutter/material.dart';

/// Similar to [Radius] but use dimensions token instead of double
class RadiusOf {
  const RadiusOf(this.context);

  final BuildContext context;

  /// Construct a circular [Radius] with value set to the corresponding dimension
  /// from the dimensions theme of given context
  Radius circular(Object dimensionsToken) {
    return Radius.circular(
      DimensionsTheme.of(context).get(dimensionsToken),
    );
  }

  /// Construct an elliptical [Radius] with value set to the corresponding dimension
  /// from the dimensions theme of given context
  Radius elliptical(
    Object x,
    Object y,
  ) {
    final radiusDimensions = DimensionsTheme.of(context);
    return Radius.elliptical(
      radiusDimensions.get(x),
      radiusDimensions.get(y),
    );
  }
}

class BorderRadiusOf {
  const BorderRadiusOf(this.context);

  final BuildContext context;

  BorderRadius circular(Object dimensionsToken) => BorderRadius.all(
        RadiusOf(context).circular(dimensionsToken),
      );
}

extension RadiusThemeExtension on BuildContext {
  RadiusOf get radius => RadiusOf(this);
  BorderRadiusOf get borderRadius => BorderRadiusOf(this);
}
