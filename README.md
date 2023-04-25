# 📏 dimensions_theme
dimensions_theme provides a theme extension to centralizes app dimensions such as padding, margins, and other dimensions within the Flutter theme and accessing them in a convenient and type safe way.

This approach also offers ensures consistency throughout the app and give you the ability to dynamically changes dimension values based on factors like screen size and user settings.
This package also provides pre-built widgets and utilities for consuming the dimensions theme in a simple and declarative way.

# Dimensions tokens and families

This package introduces seven tokens that can be assigned arbitrary values within the flutter theme:
- `largest`
- `larger`
- `large`
- `medium`
- `small`
- `smaller`
- `smallest`

While having only seven tokens may seem limiting, dimensions_theme addresses this issue by introducing dimensions families. Each dimensions family define a specific set of dimension values for a particular use case, such as spacing or border widths.

`dimensions_theme` provide actually four dimensions families:
- Spaces (dimensions of blank spaces between widgets)
- Insets (values of padding)
- Border Widths
- Border Radii

# Usage

Define your dimensions:
```dart
final dimensions = Dimensions(
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
  radii: RadiusDimensions(
    largest: 14,
    larger: 12,
    large: 10,
    medium: 8,
    small: 6,
    smaller: 4,
    smallest: 2,
  ),
  borderWidth: BorderWidthDimensions(
    // You can omit values you don't need
    medium: 2,
    small: 1,
  ),
);
```

Register dimensions as theme extension:
```dart
MaterialApp(
  ...    
  theme: ThemeData(
    extensions: [
      dimensions,
    ],
  ),
)
```

Use access values directly or use dimensions_theme utils:
```dart
final width = Dimensions.of(context).borderWidths.medium;

Padding(
  padding: EdgeInsetsOf(context).only(
    left: Dimensions.largest,
    right: Dimensions.larger,
    top: Dimensions.large,
    bottom: Dimensions.medium,
  ),
);

Space(Dimensions.small);

final radius = RadiusOf(context).circular(Dimensions.small);
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
The dimensions_theme package includes a Space widgets use to represent blank space in your application. It aim
to be a replacement to empty `SizedBox` with hardcoded values.
The `Space` widget accept a dimensions token as parameter and will fill up `SizedBox` height and width using the corresponding value defined inside the dimensions's spaces theme.
It also provide additional constructors `Space.w(token)` and `Space.h(token)` that can be used to restrict the blank space size to one dimensions (width and height respectively).

```dart
Space(Dimensions.medium),

Space.w(Dimensions.small), // width: spaces.medium, height: 0
Space.h(Dimensions.large), // width: 0, height: spaces.smallest
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

### Border widths
```dart
final border = BorderSide(
  color: Colors.black,
  width: Dimensions.of(context).borderWidths.small,
),
```

## Dynamic dimensions
While having static dimensions is often enough you may found useful to have adaptive dimensions in some case.

### ScreenUtils

```dart
final _spaceDimensions = SpaceDimensions(
  largest: 55.h,
  larger: 40.h,
  large: 30.h,
  medium: 20.h,
  small: 15.h,
  smaller: 10.h,
  smallest: 5.h,
);

final _insetsDimensions = InsetDimensions(
  largest: 50.h,
  larger: 40.h,
  large: 30.h,
  medium: 20.h,
  small: 15.h,
  smaller: 10.h,
  smallest: 5.h,
);

ScreenUtilInit(
  designSize: const Size(375, 827),
  builder:(context, child) => MaterialApp(
    theme: ThemeData(
      extensions: [
        Dimensions(
          spaces: _spaceDimensions,
          insets: _insetsDimensions,
        ),
      ],
    ),
  ),
)
```

### MediaQueries

```dart

final lightTheme = ThemeData.light();

Dimensions _computeDimension(MediaQueryData data) {
  final spaceDimensions = SpaceDimensions(
    largest: data.size.shortestSide / 5,
    larger: data.size.shortestSide / 7.5,
    large: data.size.shortestSide / 10,
    medium: data.size.shortestSide / 12.5,
    small: data.size.shortestSide / 15,
    smaller: data.size.shortestSide / 17.5,
    smallest: data.size.shortestSide / 20,
  );

  final insetsDimensions = InsetDimensions(
    largest: data.size.shortestSide / 7.5,
    larger: data.size.shortestSide / 10,
    large: data.size.shortestSide / 12.5,
    medium: data.size.shortestSide / 15,
    small: data.size.shortestSid / 17.5,
    smaller: data.size.shortestSide / 20,
    smallest: data.size.shortestSide / 22.5,
  );

  return Dimensions(
    spaces: spaceDimensions,
    insets: insetsDimensions,
  );
}

MaterialApp(
  builder: (context, child) {
    return Theme(
      data: lightTheme.copyWith(
        extensions: [
            _computeDimensions(MediaQuery.of(context)),
        ],
      ),
      child: child,
    );
  },
  home: SomeScreen(),
)
```

## Contribution | Bug report | Feature request
Please fill and issue on [github](https://github.com/Pierre2tm/dimensions_theme/issues)