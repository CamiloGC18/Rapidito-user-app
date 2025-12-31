import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Card de servicio premium para mostrar Ride, Parcel, Schedule, etc
/// Ideal para la sección de categorías en el Home
class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final bool isHighlighted;
  final bool showBadge;
  final String? badgeText;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.isHighlighted = false,
    this.showBadge = false,
    this.badgeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
          gradient: isHighlighted
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.15),
                    AppColors.primary.withOpacity(0.05),
                  ],
                )
              : null,
          color: backgroundColor ?? (isDarkMode ? AppColors.darkCard : AppColors.lightCard),
          border: Border.all(
            color: borderColor ??
                (isHighlighted
                    ? AppColors.primary.withOpacity(0.3)
                    : (isDarkMode ? AppColors.neutral700 : AppColors.neutral200)),
            width: isHighlighted ? 2 : 1,
          ),
          boxShadow: isHighlighted
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Padding(
              padding: AppDimensions.paddingMD,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon en círculo
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: icon,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.md),

                  // Título
                  Text(
                    title,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: isDarkMode
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.xs),

                  // Subtítulo
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: isDarkMode
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Badge en la esquina
            if (showBadge && badgeText != null)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppDimensions.radiusLG),
                      bottomLeft: Radius.circular(AppDimensions.radiusSM),
                    ),
                  ),
                  child: Text(
                    badgeText!,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
