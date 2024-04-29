import 'package:flutter/material.dart';

import 'dimensions_theme.dart';

enum _SpaceDirection { height, width, both }

class Space extends StatelessWidget {
  const Space(
    this.token, {
    super.key,
  }) : _dir = _SpaceDirection.both;

  const Space.w(
    this.token, {
    super.key,
  }) : _dir = _SpaceDirection.width;

  const Space.h(
    this.token, {
    super.key,
  }) : _dir = _SpaceDirection.height;

  final Object token;
  final _SpaceDirection _dir;

  @override
  Widget build(BuildContext context) {
    final space = DimensionsTheme.of(context).get(token);
    Size size;
    switch (_dir) {
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

mixin SpaceDimensionsMixin on Enum {
  Widget call() => Space(this);
  Widget Function() get h => () => Space.h(this);
  Widget Function() get w => () => Space.w(this);
}
