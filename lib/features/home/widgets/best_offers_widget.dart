import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/common_widgets/image_widget.dart';
import 'package:rapidito_user/features/my_offer/controller/offer_controller.dart';
import 'package:rapidito_user/features/my_offer/screens/discount_screen.dart';
import 'package:rapidito_user/features/my_offer/screens/my_offer_screen.dart';
import 'package:rapidito_user/features/my_offer/widgets/best_offer_shimmer_widget.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/util/styles.dart';

class BestOfferWidget extends StatelessWidget {
  const BestOfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return GetBuilder<OfferController>(builder: (offerController){
      return offerController.bestOfferModel != null ?
      (offerController.bestOfferModel!.data != null && offerController.bestOfferModel!.data!.isNotEmpty) ?
      Padding(
        padding: EdgeInsets.only(
          left: Dimensions.paddingSize,
          bottom: Dimensions.paddingSizeSmall,
          top: Dimensions.paddingSizeExtraSmall,
          right: Dimensions.paddingSize,
        ),
        child: Column(children: [
          // Header premium con título y botón "Ver todo"
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'best_offer'.tr,
              style: AppTextStyles.headingLarge.copyWith(
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => MyOfferScreen()),
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

          // Ofertas scroll premium
          SizedBox(
            width: Get.width,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offerController.bestOfferModel!.data!.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.to(() => DiscountScreen(
                    offerModel: offerController.bestOfferModel!.data![index],
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                        color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
                        border: Border.all(
                          color: isDarkMode ? AppColors.neutral700 : AppColors.neutral200,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                              isDarkMode ? 0.2 : 0.05,
                            ),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Imagen premium
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppDimensions.radiusLG),
                              topRight: Radius.circular(AppDimensions.radiusLG),
                            ),
                            child: ImageWidget(
                              image: offerController.bestOfferModel!.data![index].image!,
                              fit: BoxFit.cover,
                              height: 100,
                              width: double.infinity,
                            ),
                          ),

                          // Contenido
                          Expanded(
                            child: Padding(
                              padding: AppDimensions.paddingMD,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    offerController.bestOfferModel!.data![index].title ?? '',
                                    style: AppTextStyles.labelMedium.copyWith(
                                      color: isDarkMode
                                          ? AppColors.darkTextPrimary
                                          : AppColors.lightTextPrimary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: AppDimensions.xs),
                                  Text(
                                    offerController.bestOfferModel!.data![index].shortDescription ?? '',
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
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ) :
      const SizedBox() : const MyOfferShimmerWidget();
    });
  }
}

