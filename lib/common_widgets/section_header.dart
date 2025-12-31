import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Header premium para secciones con título y "Ver Todo"
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onSeeAll;
  final bool showSeeAll;
  final TextStyle? titleStyle;
  final Color? titleColor;

  const SectionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.onSeeAll,
    this.showSeeAll = true,
    this.titleStyle,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        AppTextStyles.headingLarge.copyWith(
                          color: titleColor ??
                              (isDarkMode
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary),
                        ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppDimensions.xs),
                    Text(
                      subtitle!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: isDarkMode
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            if (showSeeAll && onSeeAll != null)
              TextButton(
                onPressed: onSeeAll,
                child: Text(
                  'see_all'.tr,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
