import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_theme.dart';
import 'package:rapidito_user/theme/custom_theme_color.dart';

/// Light theme refactorizado usando AppThemeConfig
ThemeData lightTheme = AppThemeConfig.getLightTheme().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    CustomThemeColors.light(),
  ],
);
