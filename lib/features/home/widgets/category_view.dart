import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/common_widgets/category_widget.dart';
import 'package:rapidito_user/features/home/controllers/category_controller.dart';
import 'package:rapidito_user/features/home/widgets/category_shimmer.dart';
import 'package:rapidito_user/features/parcel/screens/parcel_screen.dart';
import 'package:rapidito_user/features/ride/controllers/ride_controller.dart';
import 'package:rapidito_user/features/set_destination/screens/set_destination_screen.dart';
import 'package:rapidito_user/features/splash/controllers/config_controller.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/util/images.dart';
import 'package:rapidito_user/util/styles.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return GetBuilder<CategoryController>(builder: (categoryController){
      return SizedBox(
        height: 105, width: Get.width,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          children: [
            categoryController.categoryList != null ?
            categoryController.categoryList!.isNotEmpty ?
            ListView.builder(
                shrinkWrap: true,
                itemCount: categoryController.categoryList!.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CategoryWidget(index: index, category: categoryController.categoryList![index]);
                }
            ) :
            const SizedBox() :
            const CategoryShimmer(),

            // Parcel Card mejorado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                onTap: () => Get.to(() =>  const ParcelScreen()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 75,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                        color: AppColors.primary.withOpacity(0.1),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Image.asset(Images.parcel),
                      ),
                    ),
                    Text(
                      'parcel'.tr,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: isDarkMode
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Schedule Trip Card mejorado
            if(Get.find<ConfigController>().config?.scheduleTripStatus ?? false)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                onTap: () => Get.to(() => const SetDestinationScreen(rideType: RideType.scheduleRide)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 75,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                        color: AppColors.success.withOpacity(0.1),
                        border: Border.all(
                          color: AppColors.success.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Image.asset(Images.scheduleTripIcon),
                      ),
                    ),
                    Text(
                      'schedule_trip'.tr,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: isDarkMode
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
