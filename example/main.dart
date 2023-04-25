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
            insets: InsetDimensions.fromMedium(20),
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
                Outlined(child: Space(Dimensions.largest)),
                Space(Dimensions.small),
                Outlined(child: Space(Dimensions.larger)),
                Space(Dimensions.small),
                Outlined(child: Space(Dimensions.large)),
                Space(Dimensions.small),
                Outlined(child: Space(Dimensions.medium)),
                Space(Dimensions.small),
                Outlined(child: Space(Dimensions.small)),
                Space(Dimensions.small),
                Outlined(child: Space(Dimensions.smaller)),
                Space(Dimensions.small),
                Outlined(child: Space(Dimensions.largest)),
              ],
            ),
            const Space(Dimensions.large),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.largest),
                ),
                const Space(Dimensions.largest),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.larger),
                ),
                const Space(Dimensions.larger),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.large),
                ),
                const Space(Dimensions.large),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.medium),
                ),
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.small),
                ),
                const Space(Dimensions.small),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.smaller),
                ),
                const Space(Dimensions.smaller),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.smallest),
                ),
              ],
            ),
            const Space(Dimensions.large),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).all(Dimensions.medium),
                ),
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(left: Dimensions.medium),
                ),
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(right: Dimensions.medium),
                ),
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding:
                      EdgeInsetsOf(context).only(bottom: Dimensions.medium),
                ),
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).only(top: Dimensions.medium),
                ),
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context)
                      .symmetric(vertical: Dimensions.medium),
                ),
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context)
                      .symmetric(horizontal: Dimensions.medium),
                ),
              ],
            ),
            const Space(Dimensions.large),
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
                const Space(Dimensions.medium),
                OutlinedPadding(
                  padding: EdgeInsetsOf(context).symmetric(
                    horizontal: Dimensions.largest,
                    vertical: Dimensions.small,
                  ),
                ),
              ],
            ),
            const Space(Dimensions.large),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Outlined(
                  radius: DimensionToken.largest,
                  width: DimensionToken.largest,
                  child: Space(Dimensions.largest),
                ),
                Space(Dimensions.largest),
                Outlined(
                    radius: DimensionToken.larger,
                    width: DimensionToken.larger,
                    child: Space(Dimensions.larger)),
                Space(Dimensions.larger),
                Outlined(
                  radius: DimensionToken.large,
                  width: DimensionToken.large,
                  child: Space(Dimensions.large),
                ),
                Space(Dimensions.large),
                Outlined(
                  radius: DimensionToken.medium,
                  width: DimensionToken.medium,
                  child: Space(Dimensions.medium),
                ),
                Space(Dimensions.medium),
                Outlined(
                  radius: DimensionToken.small,
                  width: DimensionToken.small,
                  child: Space(Dimensions.small),
                ),
                Space(Dimensions.small),
                Outlined(
                  radius: DimensionToken.smaller,
                  width: DimensionToken.smaller,
                  child: Space(Dimensions.smaller),
                ),
                Space(Dimensions.smaller),
                Outlined(
                  radius: DimensionToken.smallest,
                  width: DimensionToken.smallest,
                  child: Space(Dimensions.smallest),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
