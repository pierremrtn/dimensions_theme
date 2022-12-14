import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

void main() {
  runApp(
    MaterialApp(
      title: "dimensions_theme example",
      theme: ThemeData(extensions: [
        Dimensions(),
      ]),
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
              children: const [
                Outlined(child: SpaceLargest()),
                SpaceLargest(),
                Outlined(child: SpaceLarger()),
                SpaceLarger(),
                Outlined(child: SpaceLarge()),
                SpaceLarge(),
                Outlined(child: SpaceMedium()),
                SpaceMedium(),
                Outlined(child: SpaceSmall()),
                SpaceSmall(),
                Outlined(child: SpaceSmaller()),
                SpaceSmaller(),
                Outlined(child: SpaceSmallest()),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(padding: EdgeInsetsLargest.of(context).all),
                const SpaceLargest(),
                OutlinedPadding(padding: EdgeInsetsLarger.of(context).all),
                const SpaceLarger(),
                OutlinedPadding(padding: EdgeInsetsLarge.of(context).all),
                const SpaceLarge(),
                OutlinedPadding(padding: EdgeInsetsMedium.of(context).all),
                const SpaceMedium(),
                OutlinedPadding(padding: EdgeInsetsSmall.of(context).all),
                const SpaceSmall(),
                OutlinedPadding(padding: EdgeInsetsSmaller.of(context).all),
                const SpaceSmaller(),
                OutlinedPadding(padding: EdgeInsetsSmallest.of(context).all),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(padding: EdgeInsetsMedium.of(context).all),
                const SpaceMedium(),
                OutlinedPadding(padding: EdgeInsetsMedium.of(context).left),
                const SpaceMedium(),
                OutlinedPadding(padding: EdgeInsetsMedium.of(context).top),
                const SpaceMedium(),
                OutlinedPadding(padding: EdgeInsetsMedium.of(context).right),
                const SpaceMedium(),
                OutlinedPadding(padding: EdgeInsetsMedium.of(context).bottom),
                const SpaceMedium(),
                OutlinedPadding(padding: EdgeInsetsMedium.of(context).vertical),
                const SpaceMedium(),
                OutlinedPadding(
                    padding: EdgeInsetsMedium.of(context).horizontal),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(
                  padding: EdgeInsetsComposer.of(context).only(
                    left: EdgeInsetsLargest(),
                    top: EdgeInsetsLarge(),
                    right: EdgeInsetsSmall(),
                    bottom: EdgeInsetsSmallest(),
                  ),
                ),
                const SpaceMedium(),
                OutlinedPadding(
                  padding: EdgeInsetsComposer.of(context).symmetric(
                    horizontal: EdgeInsetsLargest(),
                    vertical: EdgeInsetsSmallest(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
