import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

abstract class EdgeInsetsDimension {
  double value(Dimensions theme);
}

/// A convenience class for creating [EdgeInsets] objects with a given edge inset value.
class EdgeInsetsBuilder {
  const EdgeInsetsBuilder._(this._value);

  final double _value;

  /// Returns an [EdgeInsets] object with the same inset value for all edges.
  EdgeInsets get all => EdgeInsets.all(_value);

  /// Returns an [EdgeInsets] object with the same inset value for the top and bottom edges.
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: _value);

  /// Returns an [EdgeInsets] object with the same inset value for the left and right edges.
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: _value);

  /// Returns an [EdgeInsets] object with the given inset value for the left edge.
  EdgeInsets get left => EdgeInsets.only(left: _value);

  /// Returns an [EdgeInsets] object with the given inset value for the top edge.
  EdgeInsets get top => EdgeInsets.only(top: _value);

  /// Returns an [EdgeInsets] object with the given inset value for the right edge.
  EdgeInsets get right => EdgeInsets.only(right: _value);

  /// Returns an [EdgeInsets] object with the given inset value for the bottom edge.
  EdgeInsets get bottom => EdgeInsets.only(bottom: _value);
}

class EdgeInsetsComposer {
  const EdgeInsetsComposer.of(this.context);

  final BuildContext context;

  EdgeInsets only({
    EdgeInsetsDimension? left,
    EdgeInsetsDimension? top,
    EdgeInsetsDimension? right,
    EdgeInsetsDimension? bottom,
  }) {
    final theme = Dimensions.of(context);
    return EdgeInsets.only(
      left: left?.value(theme) ?? 0,
      top: top?.value(theme) ?? 0,
      right: right?.value(theme) ?? 0,
      bottom: bottom?.value(theme) ?? 0,
    );
  }

  EdgeInsets symmetric({
    EdgeInsetsDimension? vertical,
    EdgeInsetsDimension? horizontal,
  }) {
    final theme = Dimensions.of(context);
    return EdgeInsets.symmetric(
      vertical: vertical?.value(theme) ?? 0,
      horizontal: horizontal?.value(theme) ?? 0,
    );
  }
}

/// {@template dimensions_theme_x_edge_insets_ctr}
/// This class provides a static `of` method to obtain an EdgeInsetBuilder
/// with the small insets value of a given `BuildContext`'s dimensions.
/// {@endtemplate}
class EdgeInsetsSmallest implements EdgeInsetsDimension {
  /// {@template dimensions_theme_x_edge_insets_of}
  /// Obtains an EdgeInsetBuilder with the small edge inset value of
  /// the given [BuildContext]'s [Dimensions].
  /// {@endtemplate}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.smallest);

  /// {@template dimensions_theme_x_edge_value}
  /// Returns the small edge insets value of the given dimensions theme.
  /// {@endtemplate}
  @override
  double value(Dimensions theme) => theme.spaces.smallest;
}

/// {@macro dimension_theme_x_edge_insets_ctr}
class EdgeInsetsSmaller implements EdgeInsetsDimension {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.smaller);

  /// {@macro dimension_theme_x_edge_value}
  @override
  double value(Dimensions theme) => theme.spaces.smaller;
}

/// {@macro dimension_theme_x_edge_insets_ctr}
class EdgeInsetsSmall implements EdgeInsetsDimension {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.small);

  /// {@macro dimension_theme_x_edge_value}
  @override
  double value(Dimensions theme) => theme.spaces.small;
}

/// {@macro dimension_theme_x_edge_insets_ctr}
class EdgeInsetsMedium implements EdgeInsetsDimension {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.medium);

  /// {@macro dimension_theme_x_edge_value}
  @override
  double value(Dimensions theme) => theme.spaces.medium;
}

/// {@macro dimension_theme_x_edge_insets_ctr}
class EdgeInsetsLarge implements EdgeInsetsDimension {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.large);

  /// {@macro dimension_theme_x_edge_value}
  @override
  double value(Dimensions theme) => theme.spaces.large;
}

/// {@macro dimension_theme_x_edge_insets_ctr}
class EdgeInsetsLarger implements EdgeInsetsDimension {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.larger);

  /// {@macro dimension_theme_x_edge_value}
  @override
  double value(Dimensions theme) => theme.spaces.larger;
}

/// {@macro dimension_theme_x_edge_insets_ctr}
class EdgeInsetsLargest implements EdgeInsetsDimension {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.largest);

  /// {@macro dimension_theme_x_edge_value}
  @override
  double value(Dimensions theme) => theme.spaces.largest;
}
