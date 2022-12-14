import 'dart:ui';

class DimensionsData<T> {
  DimensionsData({
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

  static DimensionsData<T> lerp<T>(
    DimensionsData<T> a,
    DimensionsData<T> b,
    double t,
    T? Function(T?, T?, double) lerpFunction,
  ) {
    return DimensionsData<T>(
      smallest: lerpFunction(a.smallest, b.smallest, t) as T,
      smaller: lerpFunction(a.smaller, b.smaller, t) as T,
      small: lerpFunction(a.small, b.small, t) as T,
      medium: lerpFunction(a.medium, b.medium, t) as T,
      large: lerpFunction(a.large, b.large, t) as T,
      larger: lerpFunction(a.larger, b.larger, t) as T,
      largest: lerpFunction(a.largest, b.largest, t) as T,
    );
  }

  DimensionsData<T> copyWith({
    T? smallest,
    T? smaller,
    T? small,
    T? medium,
    T? large,
    T? larger,
    T? largest,
  }) {
    return DimensionsData<T>(
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

class RadiusDimensions extends DimensionsData<Radius> {
  RadiusDimensions({
    required super.smallest,
    required super.smaller,
    required super.small,
    required super.medium,
    required super.large,
    required super.larger,
    required super.largest,
  });

  static RadiusDimensions from({
    required Radius medium,
    double scaleFactor = .2,
    Radius? smallest,
    Radius? smaller,
    Radius? small,
    Radius? large,
    Radius? larger,
    Radius? largest,
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
        factory: RadiusDimensions.new,
      );

  static RadiusDimensions lerp(
    RadiusDimensions a,
    RadiusDimensions b,
    double t,
  ) =>
      RadiusDimensions(
        smallest: Radius.lerp(a.smallest, b.smallest, t)!,
        smaller: Radius.lerp(a.smaller, b.smaller, t)!,
        small: Radius.lerp(a.small, b.small, t)!,
        medium: Radius.lerp(a.medium, b.medium, t)!,
        large: Radius.lerp(a.large, b.large, t)!,
        larger: Radius.lerp(a.larger, b.larger, t)!,
        largest: Radius.lerp(a.largest, b.largest, t)!,
      );
}

class DoubleDimensions extends DimensionsData<double> {
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
