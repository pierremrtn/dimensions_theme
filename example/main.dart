import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

enum Dimension with SpaceDimensionsMixin {
  largest,
  larger,
  large,
  medium,
  small,
  smaller,
  smallest,
}

void main() {
  runApp(
    MaterialApp(
      title: "dimensions_theme example",
      theme: ThemeData(
        extensions: const [
          DimensionsTheme({
            Dimension.largest: 30,
            Dimension.larger: 24,
            Dimension.large: 20,
            Dimension.medium: 16,
            Dimension.small: 8,
            Dimension.smaller: 4,
            Dimension.smallest: 2,
          }),
        ],
      ),
      home: const DimensionsThemeExample(),
    ),
  );
}

class DimensionsThemeExample extends StatelessWidget {
  const DimensionsThemeExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Outlined(child: Dimension.largest()),
                const Space(Dimension.small),
                Outlined(child: Dimension.larger()),
                const Space(Dimension.small),
                Outlined(child: Dimension.large()),
                const Space(Dimension.small),
                Outlined(child: Dimension.medium()),
                const Space(Dimension.small),
                Outlined(child: Dimension.small()),
                const Space(Dimension.small),
                Outlined(child: Dimension.smaller()),
                const Space(Dimension.small),
                Outlined(child: Dimension.largest()),
              ],
            ),
            Dimension.largest(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.largest),
                ),
                const Space(Dimension.largest),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.larger),
                ),
                const Space(Dimension.larger),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.large),
                ),
                const Space(Dimension.large),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.medium),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.small),
                ),
                const Space(Dimension.small),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.smaller),
                ),
                const Space(Dimension.smaller),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.smallest),
                ),
              ],
            ),
            const Space(Dimension.large),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimension.medium),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(left: Dimension.medium),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(right: Dimension.medium),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(bottom: Dimension.medium),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(top: Dimension.medium),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context)
                      .symmetric(vertical: Dimension.medium),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context)
                      .symmetric(horizontal: Dimension.medium),
                ),
              ],
            ),
            const Space(Dimension.large),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(
                    left: Dimension.medium,
                    top: Dimension.large,
                    right: Dimension.small,
                    bottom: Dimension.smallest,
                  ),
                ),
                const Space(Dimension.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).symmetric(
                    horizontal: Dimension.largest,
                    vertical: Dimension.small,
                  ),
                ),
              ],
            ),
            const Space(Dimension.large),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Outlined(
                  radius: Dimension.largest,
                  width: Dimension.largest,
                  child: Space(Dimension.largest),
                ),
                Space(Dimension.largest),
                Outlined(
                    radius: Dimension.larger,
                    width: Dimension.larger,
                    child: Space(Dimension.larger)),
                Space(Dimension.larger),
                Outlined(
                  radius: Dimension.large,
                  width: Dimension.large,
                  child: Space(Dimension.large),
                ),
                Space(Dimension.large),
                Outlined(
                  radius: Dimension.medium,
                  width: Dimension.medium,
                  child: Space(Dimension.medium),
                ),
                Space(Dimension.medium),
                Outlined(
                  radius: Dimension.small,
                  width: Dimension.small,
                  child: Space(Dimension.small),
                ),
                Space(Dimension.small),
                Outlined(
                  radius: Dimension.smaller,
                  width: Dimension.smaller,
                  child: Space(Dimension.smaller),
                ),
                Space(Dimension.smaller),
                Outlined(
                  radius: Dimension.smallest,
                  width: Dimension.smallest,
                  child: Space(Dimension.smallest),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Outlined extends StatelessWidget {
  const Outlined({
    super.key,
    required this.child,
    this.width,
    this.radius,
  });

  final Widget child;
  final Dimension? width;
  final Dimension? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: DimensionsTheme.of(context).get(width ?? Dimension.small),
        ),
        borderRadius: BorderRadius.circular(
          DimensionsTheme.of(context).get(radius ?? Dimension.small),
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
