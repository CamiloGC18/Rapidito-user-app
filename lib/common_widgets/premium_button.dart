import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Botón elevado premium con estilos consistentes
/// Soporta loading state y custom sizes
class PremiumButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final ButtonSize size;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final Widget? icon;
  final bool fullWidth;

  const PremiumButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.size = ButtonSize.medium,
    this.isOutlined = false,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.icon,
    this.fullWidth = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final bgColor = backgroundColor ?? AppColors.primary;
    final fgColor = foregroundColor ??
        (isOutlined
            ? AppColors.primary
            : (isDarkMode ? AppColors.darkBackground : Colors.white));

    final double buttonHeight = _getHeight();
    final EdgeInsets padding = _getPadding();

    if (isOutlined) {
      return OutlinedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(fgColor),
                ),
              )
            : (icon ?? SizedBox.shrink()),
        label: Text(isLoading ? '' : label),
        style: OutlinedButton.styleFrom(
          foregroundColor: fgColor,
          side: BorderSide(color: bgColor, width: 2),
          minimumSize: Size(fullWidth ? double.infinity : (width ?? 0), buttonHeight),
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
          ),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(fgColor),
              ),
            )
          : (icon ?? SizedBox.shrink()),
      label: Text(isLoading ? '' : label),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        elevation: 0,
        minimumSize: Size(fullWidth ? double.infinity : (width ?? 0), buttonHeight),
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return AppDimensions.buttonHeightSM;
      case ButtonSize.medium:
        return AppDimensions.buttonHeightMD;
      case ButtonSize.large:
        return AppDimensions.buttonHeightLG;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return AppDimensions.buttonPaddingSM;
      case ButtonSize.medium:
        return AppDimensions.buttonPaddingMD;
      case ButtonSize.large:
        return AppDimensions.buttonPaddingLG;
    }
  }
}

enum ButtonSize { small, medium, large }
