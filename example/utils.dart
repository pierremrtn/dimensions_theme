import 'package:flutter/material.dart';

class Outlined extends StatelessWidget {
  const Outlined({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
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
          color: Color.fromARGB(255, 194, 194, 194),
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
