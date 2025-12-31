import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/features/address/widgets/address_item_card.dart';
import 'package:rapidito_user/features/home/widgets/address_shimmer.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/util/images.dart';
import 'package:rapidito_user/util/styles.dart';
import 'package:rapidito_user/features/address/controllers/address_controller.dart';
import 'package:rapidito_user/features/address/screens/add_new_address.dart';

enum AddressPage{home, sender, receiver}

class HomeMyAddress extends StatefulWidget {
  final String? title;
  final AddressPage? addressPage;
  const HomeMyAddress({super.key, this.title, this.addressPage});

  @override
  State<HomeMyAddressState> createState() => _HomeMyAddressState();
}

class _HomeMyAddressState extends State<HomeMyAddress> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<AddressController>(builder: (addressController) {
      return Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMD),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
             widget.title ?? 'my_address'.tr,
            style: AppTextStyles.headingLarge.copyWith(
              color: isDarkMode
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),

          if(addressController.addressList != null && addressController.addressList!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: AppDimensions.xs),
              child: Text(
                'saved_address_for_your_trip'.tr,
                style: AppTextStyles.bodySmall.copyWith(
                  color: isDarkMode
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
            ),
          const SizedBox(height: AppDimensions.md),

          addressController.addressList != null ?
          addressController.addressList!.isNotEmpty ?
          SizedBox(
            height: Get.width *0.15,
            child: ListView.builder(
              itemCount: addressController.addressList?.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index) {
                return AddressItemCard(
                  address: addressController.addressList![index],
                );
              },
            ),
          ) :
          GestureDetector(
            onTap: ()=> Get.to(() =>   const AddNewAddress(address: null)),
            child: Container(
              padding: AppDimensions.paddingMD,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.15),
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
              child: Row(children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppDimensions.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'add_address'.tr,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: isDarkMode
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.xs),
                        Text(
                          'save_your_address_for_quick_trip'.tr,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: isDarkMode
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                    color: AppColors.primary.withOpacity(0.05),
                  ),
                  child: Image.asset(
                    Images.addNewAddress,
                    fit: BoxFit.contain,
                  ),
                ),
              ]),
            ),
          ) :
          const AddressShimmer(),
        ]),
      );
    });
  }
}
