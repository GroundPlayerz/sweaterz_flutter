import 'package:flutter/material.dart';

extension BrightnessExtension on Brightness {
  bool get isDark => this == Brightness.dark;
  bool get isLight => this == Brightness.light;
}

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get themeData => Theme.of(this);
}

extension ColorExtension on Color {
  bool get isTransparent => this == Colors.transparent;

  MaterialColor get swatch => Colors.primaries.firstWhere(
        (Color c) => c.value == value,
        orElse: () => _swatch,
      );

  Map<int, Color> get getMaterialColorValues => <int, Color>{
        50: _swatchShade(50),
        100: _swatchShade(100),
        200: _swatchShade(200),
        300: _swatchShade(300),
        400: _swatchShade(400),
        500: _swatchShade(500),
        600: _swatchShade(600),
        700: _swatchShade(700),
        800: _swatchShade(800),
        900: _swatchShade(900),
      };

  MaterialColor get _swatch => MaterialColor(value, getMaterialColorValues);

  Color _swatchShade(int swatchValue) => HSLColor.fromColor(this)
      .withLightness(1 - (swatchValue / 1000))
      .toColor();
}
