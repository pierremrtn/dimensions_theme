import 'package:flutter/material.dart';

import 'dimensions_theme.dart';

class EdgeInsetsOf {
  const EdgeInsetsOf(this.context);

  final BuildContext context;

  EdgeInsets all(DimensionToken dimension) {
    return EdgeInsets.all(
      Dimensions.of(context).insets.get(dimension),
    );
  }

  EdgeInsets only({
    DimensionToken? left,
    DimensionToken? top,
    DimensionToken? right,
    DimensionToken? bottom,
  }) {
    final theme = Dimensions.of(context).insets;
    return EdgeInsets.only(
      left: left != null ? theme.get(left) : 0,
      top: top != null ? theme.get(top) : 0,
      right: right != null ? theme.get(right) : 0,
      bottom: bottom != null ? theme.get(bottom) : 0,
    );
  }

  EdgeInsets symmetric({
    DimensionToken? vertical,
    DimensionToken? horizontal,
  }) {
    final theme = Dimensions.of(context).insets;
    return EdgeInsets.symmetric(
      vertical: vertical != null ? theme.get(vertical) : 0,
      horizontal: horizontal != null ? theme.get(horizontal) : 0,
    );
  }
}

/// A convenience class for creating [EdgeInsets] objects with a given edge inset value.
@Deprecated("Use EdgeInsetOf instead")
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

/// {@template dimensions_theme_x_edge_insets_ctr}
/// This class provides a static `of` method to obtain an EdgeInsetBuilder
/// with the small insets value of a given `BuildContext`'s dimensions.
/// {@endtemplate}
@Deprecated("Use EdgeInsetOf instead")
class EdgeInsetsSmallest {
  /// {@template dimensions_theme_x_edge_insets_of}
  /// Obtains an EdgeInsetBuilder with the small edge inset value of
  /// the given [BuildContext]'s [Dimensions].
  /// {@endtemplate}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.smallest);
}

/// {@macro dimension_theme_x_edge_insets_ctr}
@Deprecated("Use EdgeInsetOf instead")
class EdgeInsetsSmaller {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.smaller);
}

/// {@macro dimension_theme_x_edge_insets_ctr}
@Deprecated("Use EdgeInsetOf instead")
class EdgeInsetsSmall {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.small);
}

/// {@macro dimension_theme_x_edge_insets_ctr}
@Deprecated("Use EdgeInsetOf instead")
class EdgeInsetsMedium {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.medium);
}

/// {@macro dimension_theme_x_edge_insets_ctr}
@Deprecated("Use EdgeInsetOf instead")
class EdgeInsetsLarge {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.large);
}

/// {@macro dimension_theme_x_edge_insets_ctr}
@Deprecated("Use EdgeInsetOf instead")
class EdgeInsetsLarger {
  /// {@macro dimension_theme_x_edge_insets_of}
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.larger);
}

/// {@macro dimension_theme_x_edge_insets_ctr}
@Deprecated("Use EdgeInsetOf instead")
class EdgeInsetsLargest {
  static EdgeInsetsBuilder of(BuildContext context) =>
      EdgeInsetsBuilder._(Dimensions.of(context).spaces.largest);
}
