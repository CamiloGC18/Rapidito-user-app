import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_theme.dart';
import 'package:rapidito_user/theme/custom_theme_color.dart';

/// Dark theme refactorizado usando AppThemeConfig
ThemeData darkTheme = AppThemeConfig.getDarkTheme().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomThemeColors.dark(),
  ],
);
