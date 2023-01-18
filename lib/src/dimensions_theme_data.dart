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

  late final _tokenMap = {
    Dimensions.smallest: smallest,
    Dimensions.smaller: smaller,
    Dimensions.small: small,
    Dimensions.medium: medium,
    Dimensions.large: large,
    Dimensions.larger: larger,
    Dimensions.largest: largest,
  };

  T get(DimensionToken token) {
    assert(_tokenMap[token] != null, 'Forbidden token usage');
    return _tokenMap[token]!;
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

U _simpleDimensionTokensResolver<T, U>(
  T medium, {
  required T Function(T base) scaleUp,
  required T Function(T base) scaleDown,
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
  required T? smallest,
  required T? smaller,
  required T? small,
  required T? large,
  required T? larger,
  required T? largest,
}) {
  assert(() {
    return [smallest, smaller, small, medium, large, larger, largest]
            .firstWhere((element) => element != null) !=
        null;
  }());

  final T smallValue = small ?? scaleDown(medium);
  final T smallerValue = smaller ?? scaleDown(smallValue);
  final T smallestValue = smallest ?? scaleDown(smallerValue);
  final T largeValue = large ?? scaleUp(medium);
  final T largerValue = larger ?? scaleUp(largeValue);
  final T largestValue = largest ?? scaleUp(largerValue);

  return factory(
    medium: medium,
    small: smallValue,
    smaller: smallerValue,
    smallest: smallestValue,
    large: largeValue,
    larger: largerValue,
    largest: largestValue,
  );
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

  static DoubleDimensions from({
    required double medium,
    double? smallest,
    double? smaller,
    double? small,
    double? large,
    double? larger,
    double? largest,
    double scaleFactor = .2,
  }) =>
      _simpleDimensionTokensResolver(
        medium,
        smallest: smallest,
        smaller: smaller,
        small: small,
        large: large,
        larger: larger,
        largest: largest,
        scaleUp: (radius) => radius * (1 + scaleFactor),
        scaleDown: (radius) => radius * (1 - scaleFactor),
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
