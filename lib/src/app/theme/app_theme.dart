import 'package:dro_health/src/app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightTheme;
}

final ThemeData _lightTheme = ThemeData.light().copyWith(
  primaryColor: AppColors.purple,
  appBarTheme: _appBarTheme(),
  colorScheme: _colorScheme(),
  backgroundColor: AppColors.white,
  primaryTextTheme: _textTheme(),
  textTheme: _textTheme(),
  iconTheme: _iconTheme(),
  scaffoldBackgroundColor: AppColors.white,
);

_iconTheme() => const IconThemeData().copyWith(
      color: AppColors.white,
    );

_textTheme() => TextTheme(
      bodySmall: _defaultTextStyle.copyWith(
        fontSize: 12,
      ),
      bodyMedium: _defaultTextStyle,
      bodyLarge: _defaultTextStyle.copyWith(fontSize: 16),
      labelSmall: _defaultTextStyle.copyWith(fontSize: 11),
      labelMedium: _defaultTextStyle.copyWith(fontSize: 12),
      labelLarge: _defaultTextStyle.copyWith(fontSize: 14),
      titleSmall:
          _defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      titleMedium: _defaultTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: _defaultTextStyle.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    );

_colorScheme() => const ColorScheme.light().copyWith(
      primary: AppColors.purple,
      secondary: Color.lerp(
        AppColors.redGradientStart,
        AppColors.redGradientStart,
        0.5,
      ),
    );

AppBarTheme _appBarTheme() => const AppBarTheme(
      color: AppColors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
    );

TextStyle _defaultTextStyle = const TextStyle(
  fontFamily: 'ProximaNova',
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: AppColors.black,
);
