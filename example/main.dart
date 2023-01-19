import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

void main() {
  runApp(
    MaterialApp(
      title: "dimensions_theme example",
      theme: ThemeData(
        extensions: [
          Dimensions(
            spaces: SpaceDimensions(
              largest: 55,
              larger: 40,
              large: 30,
              medium: 20,
              small: 15,
              smaller: 10,
              smallest: 5,
            ),
            insets: InsetDimensions.fillMissing(
              large: 22,
              medium: 20,
              small: 18,
            ),
          ),
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
            const SpaceLarge(),
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
            const SpaceLarge(),
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
            const SpaceLarge(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(
                    left: Dimensions.medium,
                    top: Dimensions.large,
                    right: Dimensions.small,
                    bottom: Dimensions.smallest,
                  ),
                ),
                const SpaceMedium(),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).symmetric(
                    horizontal: Dimensions.largest,
                    vertical: Dimensions.small,
                  ),
                ),
              ],
            ),
            const SpaceLarge(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Outlined(
                  radius: DimensionToken.largest,
                  width: DimensionToken.largest,
                  child: SpaceLargest(),
                ),
                SpaceLargest(),
                Outlined(
                    radius: DimensionToken.larger,
                    width: DimensionToken.larger,
                    child: SpaceLarger()),
                SpaceLarger(),
                Outlined(
                  radius: DimensionToken.large,
                  width: DimensionToken.large,
                  child: SpaceLarge(),
                ),
                SpaceLarge(),
                Outlined(
                  radius: DimensionToken.medium,
                  width: DimensionToken.medium,
                  child: SpaceMedium(),
                ),
                SpaceMedium(),
                Outlined(
                  radius: DimensionToken.small,
                  width: DimensionToken.small,
                  child: SpaceSmall(),
                ),
                SpaceSmall(),
                Outlined(
                  radius: DimensionToken.smaller,
                  width: DimensionToken.smaller,
                  child: SpaceSmaller(),
                ),
                SpaceSmaller(),
                Outlined(
                  radius: DimensionToken.smallest,
                  width: DimensionToken.smallest,
                  child: SpaceSmallest(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
