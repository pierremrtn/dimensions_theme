## 0.1.1
- **Breaking** rename `Dimensions` theme extension into `DimensionsTheme`, as `Dimensions` is often desirable as the name for the enum that holds dimension tokens

## 0.1.0
- **Breaking** Migrate to dart 3
- **Breaking** Dimensions theme extension no longer enforce pre-defined token
- **Breaking** Deprecated `Space[Token]` widgets have been removed
- Added `SpaceDimensionsMixin` for construct `Space` widgets from user-defined dimension token
- Added `BuildContext` extension for padding and borderRadius

## 0.0.3
- Introduce `Space(DimensionToken token)` widget
- `Space[token]` widgets are now deprecated in favor of the new Space widget.
- **Breaking** `DoubleDimensions.fillMissing` as been renamed `DoubleDimensions.fromMedium`

## 0.0.2+1
- fix missing `RadiusDimensions` export 

## 0.0.2
- DimensionToken class has been introduced. DimensionToken represent one the token defined in the package: [smallest, smaller, small, medium, large, larger, largest]. You can access theme using Dimensions.[token].
- **Breaking**: EdgeInsetsComposer redesign:
  - You should now use `EdgeInsetsOf(context)` instead of `EdgeInsteadComposer.of(context)`. `EdgeInsetsOf(context)` api takes advantages of new Dimension's tokens and offer an API similar to the EdgeInsets class.
- **Breaking**: `EdgeInsets[Token]().value` as been removed. Use `Dimensions.of(context).insets.[token]` instead.
- **Breaking**: DimensionsData class as been renamed to DimensionsThemeData.
- DimensionsThemeData now have a get(DimensionToken) that returns the corresponding value for a given token.
- **Breaking**: RadiiTheme now use [double] values instead of [Radius].
- Introduce RadiusOf util class.
- **Breaking**: `[Space|Insets|BorderWidth|Radius]Dimensions.from` constructor is now named `Dimensions.fillMissing`.
- `[Space|Insets|BorderWidth|Radius]Dimensions` parameters are no more `required`.
- Improved readme

## 0.0.1+1
- Readme improvements

## 0.0.1
- Initial version.
