import 'package:flutter/material.dart';

import 'dimensions_theme_data.dart';

class DimensionToken {
  const DimensionToken.smallest() : _value = 1;
  const DimensionToken.smaller() : _value = 1 << 1;
  const DimensionToken.small() : _value = 1 << 2;
  const DimensionToken.medium() : _value = 1 << 3;
  const DimensionToken.large() : _value = 1 << 4;
  const DimensionToken.larger() : _value = 1 << 5;
  const DimensionToken.largest() : _value = 1 << 6;

  final int _value;

  @override
  bool operator ==(Object? other) =>
      other is DimensionToken && other._value == _value;

  @override
  int get hashCode => _value;
}

typedef SpaceDimensions = DoubleDimensions;
typedef BorderWidthDimensions = DoubleDimensions;
typedef InsetDimensions = DoubleDimensions;

final SpaceDimensions _kDefaultSpaceDimensions =
    SpaceDimensions.from(medium: 20);

final InsetDimensions _kDefaultInsetDimensions =
    InsetDimensions.from(medium: 10);

final RadiusDimensions _kDefaultRadiusDimensions =
    RadiusDimensions.from(medium: const Radius.circular(8));

final BorderWidthDimensions _kDefaultBorderWidthDimensions =
    BorderWidthDimensions.from(medium: 2);

class Dimensions extends ThemeExtension<Dimensions> {
  static const smallest = DimensionToken.smallest();
  static const smaller = DimensionToken.smaller();
  static const small = DimensionToken.small();
  static const medium = DimensionToken.medium();
  static const large = DimensionToken.large();
  static const larger = DimensionToken.larger();
  static const largest = DimensionToken.largest();

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
