import 'dart:ui';

import 'package:flutter/material.dart';

class DimensionsTheme extends ThemeExtension<DimensionsTheme> {
  static DimensionsTheme of(BuildContext context) =>
      Theme.of(context).extension<DimensionsTheme>()!;

  const DimensionsTheme(this._values);

  final Map<Object, double> _values;

  double get(Object token) => _values[token] ?? 0;

  @override
  ThemeExtension<DimensionsTheme> copyWith({
    Map<Object, double>? values,
  }) {
    return DimensionsTheme(
      values ?? _values,
    );
  }

  @override
  ThemeExtension<DimensionsTheme> lerp(
    DimensionsTheme? other,
    double t,
  ) {
    if (other is! DimensionsTheme) return this;

    return DimensionsTheme(
      _values.map(
        (key, value) => MapEntry(
          key,
          lerpDouble(value, other._values[key], t) ?? value,
        ),
      ),
    );
  }
}
