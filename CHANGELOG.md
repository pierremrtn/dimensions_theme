## 0.0.2
- DimensionToken class has been introduced. DimensionToken represent one the token defined in the package: [smallest, smaller, small, medium, large, larger, largest]. You can access theme using Dimensions.[token].
- **Breaking**: EdgeInsetsComposer redesign:
  - You should now use EdgeInsetsOf(context) instead of EdgeInsteadComposer.of(context). EdgeInsetsOf(context) api takes advantages of new Dimension's tokens and offer an API similar to the EdgeInsets class.
- **Breaking**: `EdgeInsets[Token]().value` as been removed. Use `Dimensions.of(context).insets.[token]` instead.
- **Breaking**: DimensionsData class as been renamed to DimensionsThemeData
- DimensionsThemeData now have a get(DimensionToken) that returns the corresponding value for a given token.

## 0.0.1+1
- Readme improvements

## 0.0.1
- Initial version.
