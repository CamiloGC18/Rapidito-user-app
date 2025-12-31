import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Search bar premium con diseño iOS minimalista
class PremiumSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;
  final VoidCallback? onVoiceTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool showVoiceIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const PremiumSearchBar({
    Key? key,
    required this.hintText,
    required this.onTap,
    this.onVoiceTap,
    this.controller,
    this.onChanged,
    this.showVoiceIcon = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
          color: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
          border: Border.all(
            color: isDarkMode ? AppColors.neutral700 : AppColors.neutral200,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          readOnly: true,
          onTap: onTap,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isDarkMode
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: isDarkMode
                  ? AppColors.darkTextHint
                  : AppColors.lightTextHint,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimensions.md,
              vertical: AppDimensions.sm,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: showVoiceIcon
                ? IconButton(
                    icon: Icon(
                      Icons.mic,
                      color: AppColors.primary,
                    ),
                    onPressed: onVoiceTap,
                  )
                : suffixIcon,
          ),
        ),
      ),
    );
  }
}
