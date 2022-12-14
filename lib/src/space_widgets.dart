import 'package:flutter/material.dart';

import 'dimensions_theme.dart';

enum _SpaceDirection { height, width, both }

abstract class _Space extends StatelessWidget {
  const _Space({
    super.key,
  }) : dir = _SpaceDirection.both;

  const _Space.w({
    super.key,
  }) : dir = _SpaceDirection.width;

  const _Space.h({
    super.key,
  }) : dir = _SpaceDirection.height;

  final _SpaceDirection dir;

  double _accessor(Dimensions dimensions);

  @override
  Widget build(BuildContext context) {
    final space = _accessor(Dimensions.of(context));
    Size size;
    switch (dir) {
      case _SpaceDirection.height:
        size = Size(0, space);
        break;
      case _SpaceDirection.width:
        size = Size(space, 0);
        break;
      case _SpaceDirection.both:
        size = Size(space, space);
        break;
    }
    return SizedBox.fromSize(
      size: size,
    );
  }
}

/// A blank space with the size of
/// `Dimensions.spaces.largest` of the current context.
class SpaceLargest extends _Space {
  /// A blank space with the size of `Dimensions.spaces.largest` on both axis.
  const SpaceLargest({
    super.key,
  });

  /// A blank space with the size of `Dimensions.spaces.largest` on horizontal axis.
  const SpaceLargest.w({
    super.key,
  }) : super.w();

  /// A blank space with the size of `Dimensions.spaces.largest` on vertical axis.
  const SpaceLargest.h({
    super.key,
  }) : super.h();

  @override
  double _accessor(Dimensions dimensions) => dimensions.spaces.largest;
}

/// A blank space with the size of
/// `Dimensions.spaces.larger` of the current context.
class SpaceLarger extends _Space {
  /// A blank space with the size of `Dimensions.spaces.larger` on both axis.
  const SpaceLarger({
    super.key,
  });

  /// A blank space with the size of `Dimensions.spaces.larger` on horizontal axis.
  const SpaceLarger.w({
    super.key,
  }) : super.w();

  /// A blank space with the size of `Dimensions.spaces.larger` on vertical axis.
  const SpaceLarger.h({
    super.key,
  }) : super.h();

  @override
  double _accessor(Dimensions dimensions) => dimensions.spaces.larger;
}

/// A blank space with the size of
/// `Dimensions.spaces.large` of the current context.
class SpaceLarge extends _Space {
  /// A blank space with the size of `Dimensions.spaces.large` on both axis.
  const SpaceLarge({
    super.key,
  });

  /// A blank space with the size of `Dimensions.spaces.large` on horizontal axis.
  const SpaceLarge.w({
    super.key,
  }) : super.w();

  /// A blank space with the size of `Dimensions.spaces.large` on vertical axis.
  const SpaceLarge.h({
    super.key,
  }) : super.h();

  @override
  double _accessor(Dimensions dimensions) => dimensions.spaces.large;
}

/// A blank space with the size of
/// `Dimensions.spaces.medium` of the current context.
class SpaceMedium extends _Space {
  /// A blank space with the size of `Dimensions.spaces.medium` on both axis.
  const SpaceMedium({
    super.key,
  });

  /// A blank space with the size of `Dimensions.spaces.medium` on horizontal axis.
  const SpaceMedium.w({
    super.key,
  }) : super.w();

  /// A blank space with the size of `Dimensions.spaces.medium` on vertical axis.
  const SpaceMedium.h({
    super.key,
  }) : super.h();

  @override
  double _accessor(Dimensions dimensions) => dimensions.spaces.medium;
}

/// A blank space with the size of
/// `Dimensions.spaces.small` of the current context.
class SpaceSmall extends _Space {
  /// A blank space with the size of `Dimensions.spaces.small` on both axis.
  const SpaceSmall({
    super.key,
  });

  /// A blank space with the size of `Dimensions.spaces.small` on horizontal axis.
  const SpaceSmall.w({
    super.key,
  }) : super.w();

  /// A blank space with the size of `Dimensions.spaces.small` on vertical axis.
  const SpaceSmall.h({
    super.key,
  }) : super.h();

  @override
  double _accessor(Dimensions dimensions) => dimensions.spaces.small;
}

/// A blank space with the size of
/// `Dimensions.spaces.smaller` of the current context.
class SpaceSmaller extends _Space {
  /// A blank space with the size of `Dimensions.spaces.smaller` on both axis.
  const SpaceSmaller({
    super.key,
  });

  /// A blank space with the size of `Dimensions.spaces.smaller` on horizontal axis.
  const SpaceSmaller.w({
    super.key,
  }) : super.w();

  /// A blank space with the size of `Dimensions.spaces.smaller` on vertical axis.
  const SpaceSmaller.h({
    super.key,
  }) : super.h();

  @override
  double _accessor(Dimensions dimensions) => dimensions.spaces.smaller;
}

/// A blank space with the size of
/// `Dimensions.spaces.smallest` of the current context.
class SpaceSmallest extends _Space {
  /// A blank space with the size of `Dimensions.spaces.smallest` on both axis.
  const SpaceSmallest({
    super.key,
  });

  /// A blank space with the size of `Dimensions.spaces.smallest` on horizontal axis.
  const SpaceSmallest.w({
    super.key,
  }) : super.w();

  /// A blank space with the size of `Dimensions.spaces.smallest` on vertical axis.
  const SpaceSmallest.h({
    super.key,
  }) : super.h();

  @override
  double _accessor(Dimensions dimensions) => dimensions.spaces.smallest;
}
