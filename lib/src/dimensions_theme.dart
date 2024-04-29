import 'dart:ui';

import 'package:flutter/material.dart';

class Dimensions extends ThemeExtension<Dimensions> {
  static Dimensions of(BuildContext context) =>
      Theme.of(context).extension<Dimensions>()!;

  const Dimensions(this._values);

  final Map<Object, double> _values;

  double get(Object token) => _values[token] ?? 0;

  @override
  ThemeExtension<Dimensions> copyWith({
    Map<Object, double>? values,
  }) {
    return Dimensions(
      values ?? _values,
    );
  }

  @override
  ThemeExtension<Dimensions> lerp(
    Dimensions? other,
    double t,
  ) {
    if (other is! Dimensions) return this;

    return Dimensions(
      _values.map(
        (key, value) => MapEntry(
          key,
          lerpDouble(value, other._values[key], t) ?? value,
        ),
      ),
    );
  }
}
