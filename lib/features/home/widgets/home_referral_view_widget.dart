import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/common_widgets/button_widget.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/features/refer_and_earn/controllers/refer_and_earn_controller.dart';
import 'package:rapidito_user/features/splash/controllers/config_controller.dart';
import 'package:rapidito_user/helper/display_helper.dart';
import 'package:rapidito_user/helper/price_converter.dart';
import 'package:rapidito_user/util/app_constants.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/util/images.dart';
import 'package:rapidito_user/util/styles.dart';
import 'package:share_plus/share_plus.dart';

class HomeReferralViewWidget extends StatelessWidget {
  const HomeReferralViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.15),
          width: 1.5,
        ),
      ),
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      margin: EdgeInsets.all(AppDimensions.paddingMD),
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'invite&getRewards'.tr,
              style: AppTextStyles.headingMedium.copyWith(
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            const SizedBox(height: AppDimensions.sm),

            Text(
              'share_code_with_your_friends'.tr,
              style: AppTextStyles.bodySmall.copyWith(
                color: isDarkMode
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
            const SizedBox(height: AppDimensions.md),

            GetBuilder<ReferAndEarnController>(builder: (referAndEarnController){
              return referAndEarnController.isLoading ?
              SpinKitCircle(color: AppColors.primary, size: 30.0) :
              GestureDetector(
                onTap: (){
                  Get.find<ReferAndEarnController>().getReferralDetails().then((value){
                    Get.bottomSheet(
                      const ReferralViewBottomSheetWidget(),
                      backgroundColor: isDarkMode
                          ? AppColors.darkCard
                          : AppColors.lightCard,
                      isDismissible: false,
                    );
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.sm,
                    horizontal: AppDimensions.md,
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
                    'invite_friends'.tr,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            })
          ]),
        ),

        Image.asset(Images.homeReferralIcon, height: 90, width: 100, fit: BoxFit.contain)
      ]),
    );
  }
}


class ReferralViewBottomSheetWidget extends StatelessWidget {
  const ReferralViewBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(AppDimensions.paddingMD),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(AppDimensions.radiusXL),
            topLeft: Radius.circular(AppDimensions.radiusXL),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            // Close button
            GestureDetector(
              onTap: () => Get.back(),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(AppDimensions.sm),
                  child: Icon(
                    Icons.close,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.md),

            Image.asset(Images.homeReferralIcon, height: 100, width: 100, fit: BoxFit.contain),
            const SizedBox(height: AppDimensions.md),

            Text(
              'invite&getRewards'.tr,
              style: AppTextStyles.headingMedium.copyWith(
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            const SizedBox(height: AppDimensions.md),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMD),
              child: RichText(
                text: TextSpan(
                  text: 'referral_bottom_sheet_note'.tr,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isDarkMode
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: '  ${PriceConverter.convertPrice(Get.find<ReferAndEarnController>().referralDetails?.data?.shareCodeEarning ?? 0)}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppDimensions.lg),

            // Referral code container with copy button
            Container(
              width: Get.width * 0.7,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.darkBackground
                    : AppColors.lightBackground,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.md),
                  child: Text(
                    Get.find<ReferAndEarnController>().referralDetails?.data?.referralCode ?? '',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Clipboard.setData(ClipboardData(
                      text: Get.find<ReferAndEarnController>().referralDetails?.data?.referralCode ?? '',
                    )).then((_){
                      showCustomSnackBar('copied'.tr, isError: false);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.md,
                      vertical: AppDimensions.sm,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.radiusLG),
                        bottomRight: Radius.circular(AppDimensions.radiusLG),
                      ),
                    ),
                    child: Icon(
                      Icons.copy_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(height: AppDimensions.lg),

            ButtonWidget(
              onPressed: (){
                final params = ShareParams(
                  text: 'Greetings, \n ${Get.find<ConfigController>().config?.businessName} is the best ride share & parcel delivery platform in the country.'
                      ' If you are new to this don\'t forget to use \n "${Get.find<ReferAndEarnController>().referralDetails?.data?.referralCode ?? ''}" \n '
                      'as the referral code while sign up into ${Get.find<ConfigController>().config?.businessName} & you will get rewarded.'
                      '\n\n ${AppConstants.baseUrl}'
                );

                SharePlus.instance.share(params);
              },
              width: Get.width * 0.6,
              buttonText: 'invite_friends'.tr,
            ),
            const SizedBox(height: AppDimensions.md),
          ]),
        ),
      ),
    );
  }
}
