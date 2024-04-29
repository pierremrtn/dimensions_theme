import 'package:dimensions_theme/src/dimensions_theme.dart';
import 'package:dimensions_theme/src/edge_insets_utils.dart';
import 'package:dimensions_theme/src/radius_utils.dart';
import 'package:dimensions_theme/src/space_widgets.dart';
import 'package:flutter/material.dart';

enum Spaces with SpaceDimensionsMixin {
  xxl,
  xl,
  l,
  md,
  s,
  xs,
  xxs,
}

enum Paddings {
  xxl,
  xl,
  l,
  md,
  s,
  xs,
  xxs,
  screen,
}

enum Radii {
  l,
  md,
  s,
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: const [
          DimensionsTheme({
            /// Padding
            Paddings.xxl: 20,
            Paddings.xl: 18,
            Paddings.l: 14,
            Paddings.md: 10,
            Paddings.s: 8,
            Paddings.xs: 4,
            Paddings.xxs: 2,
            Paddings.screen: 14,

            /// Spaces
            Spaces.xxl: 28,
            Spaces.xl: 24,
            Spaces.l: 20,
            Spaces.md: 16,
            Spaces.s: 12,
            Spaces.xs: 8,
            Spaces.xxs: 4,

            /// Radii
            Radii.l: 14,
            Radii.md: 10,
            Radii.s: 8,
          })
        ],
      ),
      home: Scaffold(
        body: Padding(
          padding: context.padding.all(Paddings.screen),
          child: Column(
            children: [
              Spaces.md(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    context.radius.circular(Radii.l),
                  ),
                  // borderRadius: context.borderRadius.circular(Radii.l),
                ),
                child: const Space(Spaces.l),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const App());
}
