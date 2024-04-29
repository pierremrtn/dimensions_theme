# 📏 dimensions_theme
dimensions_theme provides a theme extension to easily define and access app dimensions such as blank spaces, padding, border radius, and other dimensions within the Flutter theme.


## Define your dimensions

```dart
// Uses tokens that's best fit your project needs. You can also uses multiple enums
enum Dimension {
  xlarge,
  large,
  medium,
  small,
  xsmall,
}

...

MaterialApp(
  theme: ThemeData(
    extensions: const [
      Dimensions({
        Dimension.xlarge: 20,
        Dimension.large: 16,
        Dimension.medium: 12,
        Dimension.small: 8,
        Dimension.xsmall: 4,
      }),
    ],
  ),
);
```

### Uses multiple enum for dimensions

The `Dimensions` theme extension support using multiple enums as dimension token.
This can be useful if you want to give different kind of dimensions value their own enum.

```dart
enum Space {
  xlarge,
  large,
  medium,
  small,
  xsmall,
}

enum Padding {
  xlarge,
  large,
  medium,
  small,
  xsmall,

  screen,
}

...

MaterialApp(
  theme: ThemeData(
    extensions: const [
      Dimensions({
        Space.xlarge: 20,
        Space.large: 16,
        Space.medium: 12,
        Space.small: 8,
        Space.xsmall: 4,

        Padding.xlarge: 20,
        Padding.large: 16,
        Padding.medium: 12,
        Padding.small: 8,
        Padding.xsmall: 4,
        Padding.screen: 20,
      }),
    ],
  ),
);
```

## Consume dimensions values

You can access any dimension value using the `get`:

```dart
Dimensions.of(context).get(Dimension.small);
```

Additionaly, this package provides helpers to makes widget tree more expressive:

### Padding

The `padding` context extension constructs `EdgeInsets` using the values defined in the dimensions theme for a given dimension token.

```dart
Padding(
  padding: context.padding.all(Dimension.small)
  child: ...
)
```

This extension provides counterparts to all `EdgeInsets` constructors, but uses Dimension tokens instead of raw double values.

```dart
context.padding.all(Dimension.small)

context.padding.symmetric(
  horizontal: Dimension.medium,
  vertical: Dimensions.small,
)

context.padding.only(
  left: Dimension.large
  top: Dimension.large,
)
```

### Blank spaces

The `Space` widget creates a SizedBox with the values defined in the dimensions theme for a given dimension token.

```dart
Column(
  children: [
    SomeWidget(),
    Space(Dimensions.small),
    SomeWidget(),
  ]
)
```

Alternatively, you can uses the `SpaceDimensionsMixin` to uses dimensions token directly to generate Space widgets:

```dart
/// Add `SpaceDimensionsMixin` to your dimension token responsible of spaces
enum Spaces with SpaceDimensionsMixin {
  large,
  medium
  small,
}

...

Column(
  children: [
    SomeWidget(),
    Spaces.small(),
    SomeWidget(),
  ]
)
```

All space widgets comes with `.w` and `.h` to restrict the blank space in one axis, respectively width and height.

```dart
Space.h(Dimensions.small)
Space.w(Dimensions.small)

Spaces.small.h()
Spaces.small.w()
```

### Border radius

The `radius` context extension constructs `Radius` using the values defined in the dimensions theme for a given dimension token.

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(
      context.radius.circular(Dimensions.large),
    ),
  ),
)
```

This extension provides counterparts to all `Radius` constructors, but uses Dimension tokens instead of raw double values.

```dart
context.radius.elliptical(Dimensions.large);
context.radius.circular(Dimensions.small, Dimensions.large);
```

The extension also provides a counterpart to `BorderRadius.circular()`.

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: borderRadius.circular(Dimensions.large),
  ),
)
```