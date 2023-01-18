import 'package:dimensions_theme/src/dimensions_theme.dart';
import 'package:flutter/material.dart';

/// Similar to [Radius] but use dimensions token instead of double
class RadiusOf {
  const RadiusOf(this.context);

  final BuildContext context;

  /// Construct a circular [Radius] with value set to the corresponding dimension
  /// from the dimensions theme of given context
  Radius circular(DimensionToken dimension) {
    return Radius.circular(
      Dimensions.of(context).radii.get(dimension),
    );
  }

  /// Construct an elliptical [Radius] with value set to the corresponding dimension
  /// from the dimensions theme of given context
  Radius elliptical(
    DimensionToken x,
    DimensionToken y,
  ) {
    final radiusDimensions = Dimensions.of(context).radii;
    return Radius.elliptical(
      radiusDimensions.get(x),
      radiusDimensions.get(y),
    );
  }
}
