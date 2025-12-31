import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/features/home/widgets/voice_search_dialog.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/util/images.dart';
import 'package:rapidito_user/util/styles.dart';
import 'package:rapidito_user/features/set_destination/screens/set_destination_screen.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: SizedBox(
        height: Dimensions.searchBarSize,
        child: GestureDetector(
          onTap: () => Get.to(() => const SetDestinationScreen()),
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
                  color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Icono de búsqueda
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.md,
                  ),
                  child: Image.asset(
                    Images.homeSearchIcon,
                    color: AppColors.primary,
                    height: 20,
                    width: 20,
                  ),
                ),

                // Hint text premium
                Expanded(
                  child: Text(
                    'where_to_go'.tr,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDarkMode
                          ? AppColors.darkTextHint
                          : AppColors.lightTextHint,
                    ),
                  ),
                ),

                // Icono de micrófono
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.md,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(
                        const VoiceSearchDialog(),
                        barrierDismissible: false,
                      );
                    },
                    child: Image.asset(
                      Images.microPhoneIcon,
                      color: AppColors.primary,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
