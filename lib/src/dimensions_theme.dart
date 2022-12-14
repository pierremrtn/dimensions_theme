import 'package:flutter/material.dart';

import 'dimensions_theme_data.dart';

typedef SpaceDimensions = DoubleDimensions;
typedef BorderWidthDimensions = DoubleDimensions;
typedef InsetDimensions = DoubleDimensions;

final SpaceDimensions _kDefaultSpaceDimensions = SpaceDimensions.from(20);

final InsetDimensions _kDefaultInsetDimensions = InsetDimensions.from(10);

final RadiusDimensions _kDefaultRadiusDimensions =
    RadiusDimensions.from(const Radius.circular(8));

final BorderWidthDimensions _kDefaultBorderWidthDimensions =
    BorderWidthDimensions.from(2);

class Dimensions extends ThemeExtension<Dimensions> {
  static Dimensions of(BuildContext context) =>
      Theme.of(context).extension<Dimensions>()!;

  Dimensions({
    SpaceDimensions? spaces,
    InsetDimensions? insets,
    BorderWidthDimensions? borderWidths,
    RadiusDimensions? radii,
  })  : spaces = spaces ?? _kDefaultSpaceDimensions,
        insets = insets ?? _kDefaultInsetDimensions,
        borderWidths = borderWidths ?? _kDefaultBorderWidthDimensions,
        radii = radii ?? _kDefaultRadiusDimensions;

  final SpaceDimensions spaces;
  final InsetDimensions insets;
  final BorderWidthDimensions borderWidths;
  final RadiusDimensions radii;

  @override
  ThemeExtension<Dimensions> copyWith({
    SpaceDimensions? spaces,
    InsetDimensions? insets,
    BorderWidthDimensions? borderWidths,
    RadiusDimensions? radii,
  }) {
    return Dimensions(
      spaces: spaces ?? this.spaces,
      insets: insets ?? this.insets,
      borderWidths: borderWidths ?? this.borderWidths,
      radii: radii ?? this.radii,
    );
  }

  @override
  ThemeExtension<Dimensions> lerp(
    ThemeExtension<Dimensions>? other,
    double t,
  ) {
    if (other is! Dimensions) return this;
    return Dimensions(
      spaces: SpaceDimensions.lerp(spaces, other.spaces, t),
      borderWidths: DoubleDimensions.lerp(borderWidths, other.borderWidths, t),
      radii: RadiusDimensions.lerp(radii, other.radii, t),
      insets: InsetDimensions.lerp(insets, other.insets, t),
    );
  }
}
