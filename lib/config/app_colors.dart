import 'package:flutter/material.dart';

/// Paleta de colores premium Rapidito
/// Sistema de colores centralizado con soporte para light/dark themes
class AppColors {
  // ==================== PRIMARY COLORS ====================
  /// Color principal aguamarina - Identidad visual Rapidito
  static const Color primary = Color(0xFF00D9C0);

  /// Variante oscura del primary para hover/focus states
  static const Color primaryDark = Color(0xFF00B8A3);

  /// Variante clara del primary para backgrounds suaves
  static const Color primaryLight = Color(0xFF33E5CF);

  // ==================== LIGHT THEME COLORS ====================
  // Background
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F9FA);
  static const Color lightCard = Color(0xFFFFFFFF);

  // Text Colors - Light Theme
  static const Color lightTextPrimary = Color(0xFF1A1F36);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightTextDisabled = Color(0xFFCBD5E1);
  static const Color lightTextHint = Color(0xFF94A3B8);

  // ==================== DARK THEME COLORS ====================
  // Background
  static const Color darkBackground = Color(0xFF0A0E27);
  static const Color darkSurface = Color(0xFF1A1F3A);
  static const Color darkCard = Color(0xFF252B4A);

  // Text Colors - Dark Theme
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkTextDisabled = Color(0xFF475569);
  static const Color darkTextHint = Color(0xFF64748B);

  // ==================== SEMANTIC COLORS ====================
  /// Color de éxito / validación
  static const Color success = Color(0xFF10B981);

  /// Color de advertencia / alerta
  static const Color warning = Color(0xFFF59E0B);

  /// Color de error
  static const Color error = Color(0xFFEF4444);

  /// Color de información
  static const Color info = Color(0xFF3B82F6);

  // ==================== NEUTRAL COLORS ====================
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF3F4F6);
  static const Color neutral200 = Color(0xFFE5E7EB);
  static const Color neutral300 = Color(0xFFD1D5DB);
  static const Color neutral400 = Color(0xFF9CA3AF);
  static const Color neutral500 = Color(0xFF6B7280);
  static const Color neutral600 = Color(0xFF4B5563);
  static const Color neutral700 = Color(0xFF374151);
  static const Color neutral800 = Color(0xFF1F2937);
  static const Color neutral900 = Color(0xFF111827);

  // ==================== GRADIENT COLORS ====================
  static const List<Color> gradientPrimary = [
    Color(0xFF00D9C0),
    Color(0xFF00B8A3),
  ];

  static const List<Color> gradientSuccess = [
    Color(0xFF10B981),
    Color(0xFF059669),
  ];

  // ==================== HELPER METHODS ====================

  /// Obtiene el color de texto apropiado según el tema
  static Color getTextPrimary(bool isDarkMode) =>
      isDarkMode ? darkTextPrimary : lightTextPrimary;

  /// Obtiene el color de texto secundario según el tema
  static Color getTextSecondary(bool isDarkMode) =>
      isDarkMode ? darkTextSecondary : lightTextSecondary;

  /// Obtiene el color de background según el tema
  static Color getBackground(bool isDarkMode) =>
      isDarkMode ? darkBackground : lightBackground;

  /// Obtiene el color de surface/card según el tema
  static Color getSurface(bool isDarkMode) =>
      isDarkMode ? darkSurface : lightSurface;

  /// Obtiene el color de card según el tema
  static Color getCard(bool isDarkMode) => isDarkMode ? darkCard : lightCard;

  /// Retorna opacity de overlay semi-transparente
  static Color getOverlay(bool isDarkMode, {double opacity = 0.5}) =>
      (isDarkMode ? Colors.black : Colors.white).withOpacity(opacity);
}
