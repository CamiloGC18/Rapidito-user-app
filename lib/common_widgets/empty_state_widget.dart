import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Widget para estados vacíos (no hay datos, error, sin conexión, etc.)
class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? customIcon;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final double iconSize;
  final EdgeInsets? padding;

  const EmptyStateWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.customIcon,
    this.buttonText,
    this.onButtonPressed,
    this.iconSize = 80,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.all(AppDimensions.paddingMD),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: iconSize + 20,
              height: iconSize + 20,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
              ),
              child: Center(
                child: customIcon ??
                    Icon(
                      icon ?? Icons.inbox_outlined,
                      size: iconSize,
                      color: AppColors.primary,
                    ),
              ),
            ),
            const SizedBox(height: AppDimensions.lg),

            // Title
            Text(
              title,
              style: AppTextStyles.headingMedium.copyWith(
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            // Subtitle
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: AppDimensions.md),
                child: Text(
                  subtitle!,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isDarkMode
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            // Button
            if (buttonText != null && onButtonPressed != null)
              Padding(
                padding: const EdgeInsets.only(top: AppDimensions.lg),
                child: GestureDetector(
                  onTap: onButtonPressed,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.md,
                      horizontal: AppDimensions.lg,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      buttonText!,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
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

/// Empty state para "No internet"
class NoInternetEmptyState extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternetEmptyState({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.wifi_off_rounded,
      title: 'no_internet_connection'.tr,
      subtitle: 'please_check_your_internet_connection'.tr,
      buttonText: 'retry'.tr,
      onButtonPressed: onRetry,
    );
  }
}

/// Empty state para "No hay datos"
class NoDataEmptyState extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onRetry;

  const NoDataEmptyState({
    super.key,
    this.title,
    this.subtitle,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.inbox_outlined,
      title: title ?? 'no_data_found'.tr,
      subtitle: subtitle ?? 'no_results_available'.tr,
      buttonText: onRetry != null ? 'retry'.tr : null,
      onButtonPressed: onRetry,
    );
  }
}

/// Empty state para "Error"
class ErrorEmptyState extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onRetry;

  const ErrorEmptyState({
    super.key,
    this.title,
    this.subtitle,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.error_outline_rounded,
      title: title ?? 'something_went_wrong'.tr,
      subtitle: subtitle ?? 'please_try_again_later'.tr,
      buttonText: onRetry != null ? 'retry'.tr : null,
      onButtonPressed: onRetry,
    );
  }
}

/// Empty state para "No favoritos"
class NoFavoritesEmptyState extends StatelessWidget {
  final VoidCallback? onBrowse;

  const NoFavoritesEmptyState({super.key, this.onBrowse});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.favorite_border_rounded,
      title: 'no_favorites_yet'.tr,
      subtitle: 'start_adding_your_favorite_items'.tr,
      buttonText: onBrowse != null ? 'browse'.tr : null,
      onButtonPressed: onBrowse,
    );
  }
}

/// Empty state para "Búsqueda sin resultados"
class NoSearchResultsEmptyState extends StatelessWidget {
  final String? query;
  final VoidCallback? onClear;

  const NoSearchResultsEmptyState({
    super.key,
    this.query,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.search_off_rounded,
      title: 'no_results_found'.tr,
      subtitle: query != null ? '${'search_not_found_for'.tr} "$query"' : 'try_different_keywords'.tr,
      buttonText: onClear != null ? 'clear_search'.tr : null,
      onButtonPressed: onClear,
    );
  }
}
