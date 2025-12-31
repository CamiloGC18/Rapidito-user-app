import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/features/coupon/controllers/coupon_controller.dart';
import 'package:rapidito_user/features/home/widgets/coupon_home_shimmer.dart';
import 'package:rapidito_user/features/my_offer/screens/my_offer_screen.dart';
import 'package:rapidito_user/helper/price_converter.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/util/styles.dart';

class HomeCouponWidget extends StatelessWidget {
  const HomeCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<CouponController>(builder: (couponController){
      return couponController.couponModel != null ?
      (couponController.couponModel!.data != null && couponController.couponModel!.data!.isNotEmpty) ?
      Container(
        color: AppColors.primary.withOpacity(0.08),
        padding: EdgeInsets.only(
          top: Dimensions.paddingSizeDefault,
          left: Dimensions.paddingSize,
          right: Dimensions.paddingSize,
          bottom: Dimensions.paddingSizeDefault,
        ),
        child: Column(children: [
          // Header premium
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'coupons'.tr,
              style: AppTextStyles.headingLarge.copyWith(
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => MyOfferScreen(isCoupon: true, fromDashboard: true)),
              child: Text(
                'see_all'.tr,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
          const SizedBox(height: Dimensions.paddingSizeDefault),

          // Coupons scroll premium
          SizedBox(
            width: Get.width,
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: couponController.couponModel!.data!.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                    child: Container(
                      padding: AppDimensions.paddingMD,
                      width: Get.width * 0.65,
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.2),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(children: [
                        // Coupon info
                        SizedBox(
                          width: Get.width * 0.32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'code'.tr,
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: isDarkMode
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary,
                                ),
                              ),
                              const SizedBox(height: AppDimensions.xs),
                              Text(
                                couponController.couponModel!.data![index].couponCode ?? '',
                                style: AppTextStyles.labelMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: AppDimensions.xs),
                              Text(
                                '${couponController.couponModel!.data![index].amountType! == 'percentage' ? '${double.parse(couponController.couponModel!.data![index].coupon!).toStringAsFixed(0)} %' : PriceConverter.convertPrice(double.parse(couponController.couponModel!.data![index].coupon!))} OFF',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: isDarkMode
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),

                        // Divider
                        Expanded(
                          child: DottedLine(
                            direction: Axis.vertical,
                            dashColor: AppColors.primary.withOpacity(0.2),
                            lineThickness: 1.5,
                          ),
                        ),

                        // Apply button premium
                        InkWell(
                          onTap: () {
                            couponController.customerAppliedCoupon(
                              couponController.couponModel!.data![index].id!,
                              index,
                            );
                          },
                          child: couponController.couponModel!.data![index].isLoading
                              ? SpinKitCircle(
                                  color: AppColors.primary,
                                  size: 32.0,
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppDimensions.sm,
                                    horizontal: AppDimensions.md,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: couponController
                                            .couponModel!.data![index].isApplied!
                                        ? AppColors.primary.withOpacity(0.1)
                                        : AppColors.primary,
                                  ),
                                  child: Text(
                                    couponController.couponModel!.data![index]
                                            .isApplied!
                                        ? 'applied'.tr
                                        : 'apply'.tr,
                                    style: AppTextStyles.labelSmall.copyWith(
                                      color: couponController.couponModel!
                                              .data![index].isApplied!
                                          ? AppColors.primary
                                          : Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                        ),
                      ]),
                    ),
                  ),

                  // Decorative circles left
                  Positioned(
                    bottom: -12,
                    left: Get.width * 0.32 - 11,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  Positioned(
                    top: -12,
                    left: Get.width * 0.32 - 11,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ]);
              },
            ),
          )
        ]),
      ) :
      const SizedBox() :
      const CouponHomeShimmer();
    });
  }
}
