# 📏 dimensions_theme

Defining dimensions in a centralized location facilitates global changes and helps maintain a consistent aesthetic throughout the app, potentially saving time and effort in the development process.

dimensions_theme introduces the concept of a "Dimensions theme", a theme extension which allows for the centralization of app dimensions such as padding, margins, and border radii inside the flutter theme. This approach offers the benefit of enabling dynamic changes to dimensions based on factors like screen size and user settings. 

Furthermore, the package includes pre-built widgets and utilities for consuming the dimensions theme in a declarative manner.

## Core concept
The `Dimensions` class let you define a set of dimensions related to a specific property family. Currently, there are four such families: spaces, insets, radius, and borderWidth. Each of these families has seven tokens that represent a specific size: largest, larger, large, medium, small, smaller, and smallest. This set of tokens is intended to provide sufficient granularity and flexibility to meet most design needs.

In addition to the Dimensions class, this package provides specialized widgets and utilities that match one of the dimensions tokens. These utilities are designed to make the code more semantically relevant by referring explicitly to a given dimension token.

**Space[Size]**
The Space widget is an empty SizedBox that reads its size value from the `Dimensions` class. There is one `Space[Size]` widget for each dimensions token. The Space widget also provides `.w` and `.h` constructors to specify size in only one direction, width or height respectively.

**EdgeInsets[Size]**
The `EdgeInsets` utility class is used to construct EdgeInsets objects with values read from the `Dimensions` theme. There is one `EdgeInsets[Size]` class for each dimensions token. The EdgeInsets class provides methods for creating various configurations of EdgeInsets, such as all, left, right, top, bottom, horizontal, and vertical.

## Usage

**Add [Dimensions] extension to your theme**
```dart
import 'package:dimensions_theme/dimensions_theme.dart';

...

/// Defines your dimensions
final spaceDimensions = SpaceDimensions(
  largest: 55,
  larger: 40,
  large: 30,
  medium: 20,
  small: 15,
  smaller: 10,
  smallest: 5,
),

/// Use from constructor to auto-fill missing values
/// if you don't need all the tokens
final insetsDimensions = InsetDimensions.from(
  large: 22,
  medium: 20,
  small: 18,
);

final borderWidthsDimensions = BorderWidthDimensions(...),
final radiiDimensions = RadiusDimensions(...),

MaterialApp(
  ...    
  theme: ThemeData(
    extensions: [
      Dimensions( /// Register the Dimensions theme extension 
        spaces: spaceDimensions,
        insets: insetsDimensions,
        borderWidth: borderWidths,
        radii: radiusDimensions,
      ),
    ],
  ),
)
```

**Direct usage**
```dart
final double spaceSmall = Dimensions.of(context).spaces.small;
final Radius radiusLarge = Dimensions.of(context).radii.large;
```

**Blank space widgets**
```dart
SpaceLarger(), // SizedBox.square(dimension: Dimensions.of(context).spaces.Larger)

SpaceMedium.w(), // SizedBox(width: Dimensions.of(context).spaces.medium)

SpaceSmallest.h(), // SizedBox(height: Dimensions.of(context).spaces.smallest)
```

**EdgeInsets**
```dart
Padding(
  padding: EdgeInsetsMedium.of(context).all,
),
Container(
  padding: EdgeInsetsLarge.of(context).horizontal,
),

...

// EdgeInsets.all(Dimensions.of(context).insets.smallest)
EdgeInsetsSmallest.of(context).all

// EdgeInsets.only(left: Dimensions.of(context).insets.smaller)
EdgeInsetsSmaller.of(context).left
EdgeInsetsSmall.of(context).top
EdgeInsetsMedium.of(context).right
EdgeInsetsLarge.of(context).bottom

// EdgeInsets.symmetric(horizontal: Dimensions.of(context).insets.large)
EdgeInsetsLarger.of(context).vertical 

// EdgeInsets.horizontal(Dimensions.of(context)horizontal.insets.largest)
EdgeInsetsLargest.of(context).horizontal 
```

**EdgeInsets composition**
```dart
Padding(
  padding: EdgeInsetsComposer.of(context).only(
    left: EdgeInsetsLargest(),
    top: EdgeInsetsLarge(),
    right: EdgeInsetsSmall(),
  ),
),

Padding(
  padding: EdgeInsetsComposer.of(context).symmetric(
    horizontal: EdgeInsetsLarge(),
    vertical: EdgeInsetsSmall(),
  ),
),
```

## Contribution | Bug report | Feature request
Please fill and issue on [github](https://github.com/Pierre2tm/dimensions_theme/issues)