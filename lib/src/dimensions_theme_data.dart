import 'dart:ui';

import 'package:dimensions_theme/src/dimensions_theme.dart';

class DimensionsThemeData<T> {
  DimensionsThemeData({
    required this.smallest,
    required this.smaller,
    required this.small,
    required this.medium,
    required this.large,
    required this.larger,
    required this.largest,
  });

  final T smallest;
  final T smaller;
  final T small;
  final T medium;
  final T large;
  final T larger;
  final T largest;

  T get(DimensionToken token) {
    switch (token) {
      case DimensionToken.smallest:
        return smallest;
      case DimensionToken.smaller:
        return smaller;
      case DimensionToken.small:
        return small;
      case DimensionToken.medium:
        return medium;
      case DimensionToken.large:
        return large;
      case DimensionToken.larger:
        return larger;
      case DimensionToken.largest:
        return largest;
    }
  }

  static DimensionsThemeData<T> lerp<T>(
    DimensionsThemeData<T> a,
    DimensionsThemeData<T> b,
    double t,
    T? Function(T?, T?, double) lerpFunction,
  ) {
    return DimensionsThemeData<T>(
      smallest: lerpFunction(a.smallest, b.smallest, t) as T,
      smaller: lerpFunction(a.smaller, b.smaller, t) as T,
      small: lerpFunction(a.small, b.small, t) as T,
      medium: lerpFunction(a.medium, b.medium, t) as T,
      large: lerpFunction(a.large, b.large, t) as T,
      larger: lerpFunction(a.larger, b.larger, t) as T,
      largest: lerpFunction(a.largest, b.largest, t) as T,
    );
  }

  DimensionsThemeData<T> copyWith({
    T? smallest,
    T? smaller,
    T? small,
    T? medium,
    T? large,
    T? larger,
    T? largest,
  }) {
    return DimensionsThemeData<T>(
      smallest: smallest ?? this.smallest,
      smaller: smaller ?? this.smaller,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      larger: larger ?? this.larger,
      largest: largest ?? this.largest,
    );
  }
}

class DoubleDimensions extends DimensionsThemeData<double> {
  DoubleDimensions({
    required super.smallest,
    required super.smaller,
    required super.small,
    required super.medium,
    required super.large,
    required super.larger,
    required super.largest,
  });

  /// Fill missing dimensions based on scale factor
  static DoubleDimensions fromMedium(
    double medium, {
    ScaleDelegate scaleFactor = const ExpScaleFactor(.2),
  }) =>
      _simpleDimensionTokensResolver(
        medium,
        scaleFactor: scaleFactor,
        factory: DoubleDimensions.new,
      );

  static DoubleDimensions lerp(
    DoubleDimensions a,
    DoubleDimensions b,
    double t,
  ) =>
      DoubleDimensions(
        smallest: lerpDouble(a.smallest, b.smallest, t)!,
        smaller: lerpDouble(a.smaller, b.smaller, t)!,
        small: lerpDouble(a.small, b.small, t)!,
        medium: lerpDouble(a.medium, b.medium, t)!,
        large: lerpDouble(a.large, b.large, t)!,
        larger: lerpDouble(a.larger, b.larger, t)!,
        largest: lerpDouble(a.largest, b.largest, t)!,
      );
}

U _simpleDimensionTokensResolver<T, U>(
  T medium, {
  required ScaleDelegate scaleFactor,
  required U Function({
    required T small,
    required T smaller,
    required T smallest,
    required T medium,
    required T large,
    required T larger,
    required T largest,
  })
      factory,
}) {
  final T smallValue = scaleFactor.scaleDown(medium);
  final T smallerValue = scaleFactor.scaleDown(smallValue);
  final T smallestValue = scaleFactor.scaleDown(smallerValue);

  final T largeValue = scaleFactor.scaleUp(medium);
  final T largerValue = scaleFactor.scaleUp(largeValue);
  final T largestValue = scaleFactor.scaleUp(largerValue);

  return factory(
    small: smallValue,
    smaller: smallerValue,
    smallest: smallestValue,
    medium: medium,
    large: largeValue,
    larger: largerValue,
    largest: largestValue,
  );
}

abstract class ScaleDelegate<T> {
  T scaleUp(T base);
  T scaleDown(T base);
}

class ExpScaleFactor implements ScaleDelegate<num> {
  const ExpScaleFactor(this.factor);

  final num factor;

  @override
  num scaleUp(num base) => base * (1 + factor);

  @override
  num scaleDown(num base) => base * (1 - factor);
}

class LinearScaleFactor implements ScaleDelegate<num> {
  const LinearScaleFactor(this.gap);

  final num gap;

  @override
  num scaleUp(num base) => base + gap;

  @override
  num scaleDown(num base) => base - gap;
}
