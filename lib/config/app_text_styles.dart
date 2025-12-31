import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/util/app_constants.dart';

/// Estilos de texto reutilizables y consistentes
/// Implementa jerarquía tipográfica premium con SF Pro Text
class AppTextStyles {
  // ==================== DISPLAY STYLES (Títulos principales) ====================
  /// Display 1 - Muy grande y prominent (32sp)
  static const TextStyle displayLarge = TextStyle(
    fontFamily: AppConstants.fontFamily, // SF Pro Text
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: -0.5,
  );

  /// Display 2 - Grande (28sp)
  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    height: 1.3,
    letterSpacing: -0.25,
  );

  /// Display 3 - Mediano (24sp)
  static const TextStyle displaySmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    height: 1.35,
  );

  // ==================== HEADING STYLES ====================
  /// Heading 1 - Título principal de sección (20sp)
  static const TextStyle headingLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  /// Heading 2 - Subtítulo de sección (18sp)
  static const TextStyle headingMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.44,
  );

  /// Heading 3 - Heading pequeño (16sp)
  static const TextStyle headingSmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  // ==================== BODY STYLES ====================
  /// Body Large - Texto principal (16sp)
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Body Medium - Texto normal (14sp) - MÁS USADO
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.57,
    letterSpacing: 0.2,
  );

  /// Body Small - Texto pequeño (12sp)
  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.67,
    letterSpacing: 0.4,
  );

  // ==================== LABEL STYLES ====================
  /// Label Large - Labels de botones (14sp, semibold)
  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
  );

  /// Label Medium - Labels pequeños (12sp, semibold)
  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1.67,
    letterSpacing: 0.5,
  );

  /// Label Small - Labels muy pequeños (10sp, semibold)
  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 10.0,
    fontWeight: FontWeight.w600,
    height: 1.8,
    letterSpacing: 0.5,
  );

  // ==================== COLORED TEXT STYLES ====================
  /// Heading con color primary
  static const TextStyle headingPrimary = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.primary,
  );

  /// Body con color success
  static const TextStyle bodySuccess = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.57,
    color: AppColors.success,
  );

  /// Body con color error
  static const TextStyle bodyError = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.57,
    color: AppColors.error,
  );

  /// Body con color warning
  static const TextStyle bodyWarning = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.57,
    color: AppColors.warning,
  );

  // ==================== HELPER METHODS ====================

  /// Retorna el color de texto según el tema
  static Color getTextColor(TextStyle style, bool isDarkMode) {
    if (style.color != null) {
      return style.color!;
    }
    return isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
  }

  /// Crea un TextStyle con color personalizado
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Crea un TextStyle con opacity personalizado
  static TextStyle withOpacity(TextStyle style, double opacity) {
    return style.copyWith(
      color: style.color?.withOpacity(opacity) ??
          AppColors.lightTextPrimary.withOpacity(opacity),
    );
  }

  /// Crea un TextStyle con weight personalizado
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Crea un TextStyle con fontSize personalizado
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  /// Crea un TextStyle con altura de línea personalizada
  static TextStyle withLineHeight(TextStyle style, double height) {
    return style.copyWith(height: height);
  }
}
