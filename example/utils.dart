import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

class Outlined extends StatelessWidget {
  const Outlined({
    super.key,
    required this.child,
    this.width,
    this.radius,
  });

  final Widget child;
  final DimensionToken? width;
  final DimensionToken? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: Dimensions.of(context)
              .borderWidths
              .get(width ?? Dimensions.small),
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.of(context).radii.get(radius ?? Dimensions.small),
        ),
      ),
      child: child,
    );
  }
}

class OutlinedPadding extends StatelessWidget {
  const OutlinedPadding({
    super.key,
    required this.padding,
  });

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Outlined(
      child: Padding(
        padding: padding,
        child: Container(
          color: const Color.fromARGB(255, 194, 194, 194),
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
