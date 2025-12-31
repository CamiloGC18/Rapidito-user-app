import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/util/app_constants.dart';

/// Configuración centralizada de temas Material 3
/// Mantiene consistencia visual en toda la aplicación
class AppThemeConfig {
  // ==================== LIGHT THEME ====================
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppConstants.fontFamily,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryLight,
        onPrimaryContainer: AppColors.primary,
        secondary: AppColors.primary,
        onSecondary: Colors.white,
        tertiary: AppColors.success,
        onTertiary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightTextPrimary,
        outline: AppColors.neutral300,
      ),

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.lightBackground,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightTextPrimary,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headingLarge.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.lightTextPrimary,
          size: AppDimensions.iconMD,
        ),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeightMD),
          padding: AppDimensions.buttonPaddingMD,
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadiusLG,
          ),
          textStyle: AppTextStyles.labelLarge.copyWith(color: Colors.white),
        ),
      ),

      // OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeightMD),
          padding: AppDimensions.buttonPaddingMD,
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadiusLG,
          ),
          textStyle: AppTextStyles.labelLarge.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),

      // TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.labelLarge,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        contentPadding: AppDimensions.inputPadding,
        border: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.neutral200,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.lightTextHint,
        ),
        labelStyle: AppTextStyles.labelMedium.copyWith(
          color: AppColors.primary,
        ),
        helperStyle: AppTextStyles.bodySmall.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        errorStyle: AppTextStyles.bodySmall.copyWith(
          color: AppColors.error,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusXL,
        ),
        color: AppColors.lightCard,
        shadowColor: Colors.black.withOpacity(0.05),
        margin: AppDimensions.marginMD,
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: AppColors.neutral200,
        thickness: 1,
        space: AppDimensions.lg,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightBackground,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusXL,
        ),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextStyles.headingLarge.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.lightTextSecondary,
        ),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.neutral900,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusLG,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        displayMedium: AppTextStyles.displayMedium.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        displaySmall: AppTextStyles.displaySmall.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        headlineLarge: AppTextStyles.headingLarge.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        headlineMedium: AppTextStyles.headingMedium.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        headlineSmall: AppTextStyles.headingSmall.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        titleLarge: AppTextStyles.headingLarge.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        titleMedium: AppTextStyles.headingMedium.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        titleSmall: AppTextStyles.headingSmall.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        bodySmall: AppTextStyles.bodySmall.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        labelLarge: AppTextStyles.labelLarge.copyWith(
          color: AppColors.primary,
        ),
        labelMedium: AppTextStyles.labelMedium.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        labelSmall: AppTextStyles.labelSmall.copyWith(
          color: AppColors.lightTextDisabled,
        ),
      ),

      // Page Transition
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      // Extensions
      extensions: [
        _buildColorSchemeExtension(isDark: false),
      ],
    );
  }

  // ==================== DARK THEME ====================
  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppConstants.fontFamily,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.darkBackground,
        primaryContainer: AppColors.primaryDark,
        onPrimaryContainer: AppColors.primaryLight,
        secondary: AppColors.primary,
        onSecondary: AppColors.darkBackground,
        tertiary: AppColors.success,
        onTertiary: AppColors.darkBackground,
        error: AppColors.error,
        onError: Colors.white,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkTextPrimary,
        outline: AppColors.neutral700,
      ),

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.darkBackground,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkTextPrimary,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headingLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.darkTextPrimary,
          size: AppDimensions.iconMD,
        ),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.darkBackground,
          elevation: 0,
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeightMD),
          padding: AppDimensions.buttonPaddingMD,
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadiusLG,
          ),
          textStyle: AppTextStyles.labelLarge.copyWith(
            color: AppColors.darkBackground,
          ),
        ),
      ),

      // OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeightMD),
          padding: AppDimensions.buttonPaddingMD,
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadiusLG,
          ),
          textStyle: AppTextStyles.labelLarge.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),

      // TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.labelLarge,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        contentPadding: AppDimensions.inputPadding,
        border: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.neutral700,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppDimensions.borderRadiusLG,
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.darkTextHint,
        ),
        labelStyle: AppTextStyles.labelMedium.copyWith(
          color: AppColors.primary,
        ),
        helperStyle: AppTextStyles.bodySmall.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        errorStyle: AppTextStyles.bodySmall.copyWith(
          color: AppColors.error,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusXL,
        ),
        color: AppColors.darkCard,
        shadowColor: Colors.black.withOpacity(0.3),
        margin: AppDimensions.marginMD,
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: AppColors.neutral700,
        thickness: 1,
        space: AppDimensions.lg,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkBackground,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusXL,
        ),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextStyles.headingLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.darkTextSecondary,
        ),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.neutral900,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusLG,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        displayMedium: AppTextStyles.displayMedium.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        displaySmall: AppTextStyles.displaySmall.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineLarge: AppTextStyles.headingLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineMedium: AppTextStyles.headingMedium.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineSmall: AppTextStyles.headingSmall.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleLarge: AppTextStyles.headingLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleMedium: AppTextStyles.headingMedium.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleSmall: AppTextStyles.headingSmall.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        bodySmall: AppTextStyles.bodySmall.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: AppTextStyles.labelLarge.copyWith(
          color: AppColors.primary,
        ),
        labelMedium: AppTextStyles.labelMedium.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelSmall: AppTextStyles.labelSmall.copyWith(
          color: AppColors.darkTextDisabled,
        ),
      ),

      // Page Transition
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      // Extensions
      extensions: [
        _buildColorSchemeExtension(isDark: true),
      ],
    );
  }

  // ==================== HELPER METHODS ====================

  /// Construye una extensión de esquema de colores personalizado
  static ThemeExtension<_ColorSchemeExtension> _buildColorSchemeExtension({
    required bool isDark,
  }) {
    return _ColorSchemeExtension(
      isDark: isDark,
      primaryGradient: AppColors.gradientPrimary,
      successGradient: AppColors.gradientSuccess,
    );
  }
}

/// Extensión de tema personalizada para colores adicionales
class _ColorSchemeExtension extends ThemeExtension<_ColorSchemeExtension> {
  final bool isDark;
  final List<Color> primaryGradient;
  final List<Color> successGradient;

  _ColorSchemeExtension({
    required this.isDark,
    required this.primaryGradient,
    required this.successGradient,
  });

  @override
  _ColorSchemeExtension copyWith({
    bool? isDark,
    List<Color>? primaryGradient,
    List<Color>? successGradient,
  }) {
    return _ColorSchemeExtension(
      isDark: isDark ?? this.isDark,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      successGradient: successGradient ?? this.successGradient,
    );
  }

  @override
  _ColorSchemeExtension lerp(
    ThemeExtension<_ColorSchemeExtension>? other,
    double t,
  ) {
    if (other is! _ColorSchemeExtension) return this;
    return _ColorSchemeExtension(
      isDark: other.isDark,
      primaryGradient: primaryGradient,
      successGradient: successGradient,
    );
  }
}
