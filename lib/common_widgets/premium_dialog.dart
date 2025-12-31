import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Custom dialog premium personalizado
class PremiumDialog {
  /// Muestra un diálogo de confirmación premium
  static Future<bool?> showConfirmation({
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    bool isDangerous = false,
  }) async {
    final isDarkMode = Get.isDarkMode;

    return await Get.dialog<bool>(
      Dialog(
        backgroundColor: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMD),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                title,
                style: AppTextStyles.headingMedium.copyWith(
                  color: isDarkMode
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: AppDimensions.md),

              // Message
              Text(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDarkMode
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.lg),

              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(result: false),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.md,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.3),
                            width: 1.5,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusMD),
                        ),
                        child: Text(
                          cancelText ?? 'cancel'.tr,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.md),

                  // Confirm button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(result: true),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.md,
                        ),
                        decoration: BoxDecoration(
                          color: isDangerous
                              ? AppColors.error
                              : AppColors.primary,
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusMD),
                          boxShadow: [
                            BoxShadow(
                              color: (isDangerous
                                      ? AppColors.error
                                      : AppColors.primary)
                                  .withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          confirmText ?? 'confirm'.tr,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Muestra un diálogo de información
  static Future<void> showInfo({
    required String title,
    required String message,
    String? buttonText,
    IconData? icon,
  }) async {
    final isDarkMode = Get.isDarkMode;

    await Get.dialog(
      Dialog(
        backgroundColor: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMD),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              if (icon != null) ...[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.md),
              ],

              // Title
              Text(
                title,
                style: AppTextStyles.headingMedium.copyWith(
                  color: isDarkMode
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: AppDimensions.md),

              // Message
              Text(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDarkMode
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.lg),

              // Button
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.md,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    buttonText ?? 'ok'.tr,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Muestra un diálogo de error
  static Future<void> showError({
    required String title,
    required String message,
    String? buttonText,
  }) async {
    await showInfo(
      title: title,
      message: message,
      buttonText: buttonText ?? 'close'.tr,
      icon: Icons.error_outline_rounded,
    );
  }

  /// Muestra un diálogo de éxito
  static Future<void> showSuccess({
    required String title,
    required String message,
    String? buttonText,
  }) async {
    await showInfo(
      title: title,
      message: message,
      buttonText: buttonText ?? 'done'.tr,
      icon: Icons.check_circle_outline_rounded,
    );
  }

  /// Muestra un bottom sheet personalizado
  static Future<T?> showBottomSheet<T>({
    required String title,
    required Widget content,
    bool isDismissible = true,
    bool enableDrag = true,
  }) async {
    final isDarkMode = Get.isDarkMode;

    return await Get.bottomSheet<T>(
      Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusXL),
            topRight: Radius.circular(AppDimensions.radiusXL),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Padding(
              padding: EdgeInsets.only(top: AppDimensions.md),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Title
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMD),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.headingMedium.copyWith(
                      color: isDarkMode
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(AppDimensions.sm),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.paddingMD),
                  child: content,
                ),
              ),
            ),
          ],
        ),
      ),
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }
}
