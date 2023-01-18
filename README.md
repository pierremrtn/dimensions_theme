# 📏 dimensions_theme
dimensions_theme introduces the concept of a "Dimensions theme", a theme extension which allows for the centralization of app dimensions such as padding, margins, and other dimensions inside the flutter theme. This approach offers the benefit of enabling dynamic changes to dimensions based on factors like screen size and user settings.
It also enforce the use of well-defined dimensions value, resulting in greater consistent throughout the app. 

Furthermore, the package includes pre-built widgets and utilities for consuming the dimensions theme in a simple and declarative way.

# Dimensions tokens
DimensionsTheme provides seven tokens that you can use to define your dimensions: `largest`, `larger`, `large`, `medium`, `small`, `smaller`, `smallest`.

# Usage
## Define your dimensions theme
```dart
MaterialApp(
  ...    
  theme: ThemeData(
    extensions: [
      Dimensions( /// Register the Dimensions theme extension 
        spaces: SpaceDimensions(
          largest: 55,
          larger: 40,
          large: 30,
          medium: 20,
          small: 15,
          smaller: 10,
          smallest: 5,
        ),
        insets: InsetsDimensions(
          largest: 30,
          larger: 20,
          large: 15,
          medium: 10,
          small: 7.5,
          smaller: 5,
          smallest: 2.5,
        ),
        borderWidth: BorderWidthDimensions(...),
        radii: RadiusDimensions(...),
      ),
    ],
  ),
)
```
## Accessing dimensions values
### Direct access

```dart
final double spaceSmall = Dimensions.of(context).spaces.small;
final double paddingLarge = Dimensions.of(context).insets.large;
```

### Blank space
Space widgets are sized box with pre-filled height/width based on the corresponding space value you've specified inside the dimensions theme.
```dart
SpaceLargest(),
SpaceLarger(),
SpaceLarge(),
SpaceMedium(),
SpaceSmall(),
SpaceSmaller(),
SpaceSmallest(),

SpaceMedium.w(), // width: spaces.medium, height: 0
SpaceSmallest.h(), // width: 0, height: spaces.smallest
```

### EdgeInsets
The `EdgeInsetsOf` class provides same constructor than the regular `EdgeInsets` class but takes dimensions token as parameter instead of doubles:
```dart
Padding(
  padding: EdgeInsetsOf(context).all(Dimensions.small),
),

Padding(
  padding: EdgeInsetsOf(context).only(
    left: Dimensions.largest,
    right: Dimensions.larger,
    top: Dimensions.large,
    bottom: Dimensions.medium,
  ),
),

Container(
  padding: EdgeInsetsOf(context).symmetric(
    horizontal: Dimensions.large,
    vertical: Dimensions.medium,
  ),
),
```

## Contribution | Bug report | Feature request
Please fill and issue on [github](https://github.com/Pierre2tm/dimensions_theme/issues)