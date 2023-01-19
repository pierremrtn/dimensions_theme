# 📏 dimensions_theme
dimensions_theme introduces the concept of a "Dimensions theme", a theme extension that centralizes app dimensions such as padding, margins, and other dimensions within the Flutter theme. 
Centralizing dimensions in one place simplifies change and ensures consistency throughout the app.
This approach also offers the benefit of being able to dynamically changes the dimensions values based on factors like screen size and user settings.

This package also provides pre-built widgets and utilities for consuming the dimensions theme in a simple and declarative way.

# Dimensions tokens and families
DimensionsTheme provides seven tokens that you can use to define your dimensions: `largest`, `larger`, `large`, `medium`, `small`, `smaller`, `smallest`.

The Dimensions theme supports specialized dimensions theme for various usages such as blank spaces or paddings, each one containing the seven dimension tokens.
This package actually supports:
- Spaces (dimensions of blank spaces between widgets)
- Insets (values of padding)
- Border Widths
- Border Radii

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
        borderWidth: BorderWidthDimensions(
          // You can omit some values
          medium: 2,
          small: 1,
        ),
        radii: RadiusDimensions(
          large: 12
          medium: 10,
          small: 8,
        ),
      ),
    ],
  ),
)
```
## Accessing dimensions values
### Direct access
You can access any token value using the following syntaxe: `Dimensions.of(context).[family].[token]`.

**Example:**
```dart
final double spaceSmall = Dimensions.of(context).spaces.largest;
final double paddingLarge = Dimensions.of(context).insets.large;
final double borderWidth = Dimensions.of(context).borderWidths.medium;
final double radius = Dimensions.of(context).radii.small;
```

### Blank spaces
The dimensions_theme package includes pre-defined space widgets, such as `SpaceMedium` and `SpaceLarge`, which are `SizedBox` widgets with pre-filled height/width values based on the corresponding space value specified in the dimensions theme.
You can construct blank space widgets for any token using like so: `Space[token]()`.
You can also restrict the blank space size to one dimensions (width or height) using `Space[token].w()` or `Space[token].h()`.

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
The `EdgeInsetsOf` class provides same constructor than the regular `EdgeInsets` class but takes dimensions tokens as parameters instead of raw doubles:
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

### Radii
The `RadiusOf` class provides similar constructors API that the regular `Radius` but takes some dimensions token as parameters instead of raw doubles.
```dart
borderRadius: BorderRadius.all(
  RadiusOf(context).circular(Dimensions.small),
),
borderRadius: BorderRadius.all(
  RadiusOf(context).elliptical(Dimensions.small, Dimensions.medium),
),
borderRadius: BorderRadius.circular(
  Dimensions.of(context).radii.small,
),
```


## Contribution | Bug report | Feature request
Please fill and issue on [github](https://github.com/Pierre2tm/dimensions_theme/issues)