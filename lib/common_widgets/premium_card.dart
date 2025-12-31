import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Card premium con glassmorphism sutil y sombras suaves
/// Ideal para mostrar información en un contenedor elegante
class PremiumCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double elevation;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Gradient? gradient;

  const PremiumCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = AppDimensions.radiusXL,
    this.elevation = AppDimensions.elevationSM,
    this.onTap,
    this.border,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = backgroundColor ??
        (isDarkMode ? AppColors.darkCard : AppColors.lightCard);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border ??
              (borderColor != null
                  ? Border.all(color: borderColor!, width: 1)
                  : null),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.05),
              blurRadius: elevation * 2.5,
              offset: Offset(0, elevation),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: padding ?? AppDimensions.paddingMD,
          child: child,
        ),
      ),
    );
  }
}

/// Card con glassmorphism effect para overlays premium
class GlassmorphicCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final double blurAmount;
  final Color? glassColor;

  const GlassmorphicCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = AppDimensions.radiusXL,
    this.blurAmount = 10.0,
    this.glassColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  (glassColor ?? Colors.white).withOpacity(isDarkMode ? 0.1 : 0.8),
                  (glassColor ?? Colors.white).withOpacity(isDarkMode ? 0.05 : 0.5),
                ],
              ),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.white.withOpacity(isDarkMode ? 0.2 : 0.2),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: padding ?? AppDimensions.paddingMD,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

// Necesitamos importar ImageFilter
import 'dart:ui';
