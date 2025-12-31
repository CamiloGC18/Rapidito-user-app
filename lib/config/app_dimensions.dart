import 'package:flutter/material.dart';

/// Sistema de dimensiones y espaciado consistente (8pt grid)
/// Facilita la creación de UIs responsivas y alineadas
class AppDimensions {
  // ==================== BASE SPACING (8pt GRID) ====================
  /// 4px - Espaciado extra pequeño
  static const double xs = 4.0;

  /// 8px - Espaciado pequeño
  static const double sm = 8.0;

  /// 16px - Espaciado mediano (más común)
  static const double md = 16.0;

  /// 24px - Espaciado grande
  static const double lg = 24.0;

  /// 32px - Espaciado extra grande
  static const double xl = 32.0;

  /// 48px - Espaciado jumbo
  static const double xxl = 48.0;

  // ==================== PADDING PRESETS ====================
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);

  // Padding horizontal y vertical
  static const EdgeInsets paddingHorizontalSM =
      EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMD =
      EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLG =
      EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingHorizontalXL =
      EdgeInsets.symmetric(horizontal: xl);

  static const EdgeInsets paddingVerticalSM = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMD = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLG = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets paddingVerticalXL = EdgeInsets.symmetric(vertical: xl);

  // ==================== MARGIN PRESETS ====================
  static const EdgeInsets marginXS = EdgeInsets.all(xs);
  static const EdgeInsets marginSM = EdgeInsets.all(sm);
  static const EdgeInsets marginMD = EdgeInsets.all(md);
  static const EdgeInsets marginLG = EdgeInsets.all(lg);
  static const EdgeInsets marginXL = EdgeInsets.all(xl);
  static const EdgeInsets marginXXL = EdgeInsets.all(xxl);

  // ==================== BORDER RADIUS ====================
  /// 8px - Pequeño redondeado
  static const double radiusSM = 8.0;

  /// 12px - Mediano redondeado
  static const double radiusMD = 12.0;

  /// 16px - Grande redondeado
  static const double radiusLG = 16.0;

  /// 20px - Extra grande redondeado
  static const double radiusXL = 20.0;

  /// 24px - Jumbo redondeado
  static const double radiusXXL = 24.0;

  /// 50px - Circular máximo
  static const double radiusMax = 50.0;

  // Border radius presets
  static const BorderRadius borderRadiusSM =
      BorderRadius.all(Radius.circular(radiusSM));
  static const BorderRadius borderRadiusMD =
      BorderRadius.all(Radius.circular(radiusMD));
  static const BorderRadius borderRadiusLG =
      BorderRadius.all(Radius.circular(radiusLG));
  static const BorderRadius borderRadiusXL =
      BorderRadius.all(Radius.circular(radiusXL));
  static const BorderRadius borderRadiusXXL =
      BorderRadius.all(Radius.circular(radiusXXL));

  // ==================== ICON SIZES ====================
  static const double iconXS = 16.0;
  static const double iconSM = 20.0;
  static const double iconMD = 24.0;
  static const double iconLG = 32.0;
  static const double iconXL = 48.0;
  static const double iconXXL = 64.0;

  // ==================== BUTTON SIZES ====================
  static const double buttonHeightSM = 40.0;
  static const double buttonHeightMD = 48.0;
  static const double buttonHeightLG = 56.0;

  static const EdgeInsets buttonPaddingSM =
      EdgeInsets.symmetric(horizontal: md, vertical: sm);
  static const EdgeInsets buttonPaddingMD =
      EdgeInsets.symmetric(horizontal: lg, vertical: md);
  static const EdgeInsets buttonPaddingLG =
      EdgeInsets.symmetric(horizontal: xl, vertical: lg);

  // ==================== INPUT FIELD SIZES ====================
  static const double inputHeight = 48.0;
  static const EdgeInsets inputPadding =
      EdgeInsets.symmetric(horizontal: md, vertical: sm);

  // ==================== CARD ELEVATION/SHADOW ====================
  /// Sombra muy suave (hover states)
  static const double elevationXS = 1.0;

  /// Sombra suave
  static const double elevationSM = 2.0;

  /// Sombra mediana
  static const double elevationMD = 4.0;

  /// Sombra prominente
  static const double elevationLG = 8.0;

  /// Sombra fuerte
  static const double elevationXL = 12.0;

  // ==================== RESPONSIVE BREAKPOINTS ====================
  static const double mobileSmall = 320.0;
  static const double mobileMedium = 375.0;
  static const double mobileLarge = 430.0;
  static const double tabletSmall = 600.0;
  static const double tabletMedium = 768.0;
  static const double tabletLarge = 900.0;
  static const double desktop = 1200.0;

  // ==================== HELPER METHODS ====================

  /// Retorna padding adaptativo según el ancho de pantalla
  static EdgeInsets getAdaptivePadding(double screenWidth) {
    if (screenWidth < tabletSmall) {
      return paddingMD; // Móvil
    } else if (screenWidth < tabletLarge) {
      return paddingLG; // Tablet pequeña
    } else {
      return paddingXL; // Tablet grande/Desktop
    }
  }

  /// Retorna el radio de borde adaptativo
  static double getAdaptiveRadius(double screenWidth) {
    if (screenWidth < tabletSmall) {
      return radiusMD;
    } else if (screenWidth < tabletLarge) {
      return radiusLG;
    } else {
      return radiusXL;
    }
  }

  /// Retorna el tamaño de icono adaptativo
  static double getAdaptiveIconSize(double screenWidth) {
    if (screenWidth < tabletSmall) {
      return iconMD;
    } else if (screenWidth < tabletLarge) {
      return iconLG;
    } else {
      return iconXL;
    }
  }
}
