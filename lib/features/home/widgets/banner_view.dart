import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/features/home/controllers/banner_controller.dart';
import 'package:rapidito_user/features/home/widgets/banner_shimmer.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/features/splash/controllers/config_controller.dart';
import 'package:rapidito_user/common_widgets/image_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerView extends StatefulWidget {
  const BannerView({super.key});

  @override
  State<BannerViewState> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String baseurl = Get.find<ConfigController>().config!.imageBaseUrl!.banner!;
    return GetBuilder<BannerController>(
      builder: (bannerController) {

        return  bannerController.bannerList != null? bannerController.bannerList!.isNotEmpty?
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMD,
            vertical: AppDimensions.sm,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  disableCenter: true,
                  autoPlayInterval: const Duration(seconds: 7),
                  onPageChanged: (index, reason) {
                    activeIndex = index;
                    setState(() {
                    });
                  },
                ),
                itemCount: bannerController.bannerList!.length,
                itemBuilder: (context, index, _) {
                  return GestureDetector(
                    onTap: (){
                      bannerController.updateBannerClickCount(bannerController.bannerList![index].id!);
                      debugPrint("=click===> ${bannerController.bannerList![index].redirectLink!}");
                      if(bannerController.bannerList![index].redirectLink != null){
                        _launchUrl(Uri.parse(bannerController.bannerList![index].redirectLink!));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.15),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                          child: Stack(
                            children: [
                              ImageWidget(
                                image: '$baseurl/${bannerController.bannerList![index].image}',
                                fit: BoxFit.cover,
                              ),
                              // Gradient overlay
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.1),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppDimensions.md),
            
            // Premium dot indicators
            SizedBox(
              height: 6,
              width: Get.width,
              child: Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: bannerController.bannerList!.length,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 6,
                      width: index == activeIndex ? 24 : 6,
                      decoration: BoxDecoration(
                        color: index == activeIndex
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: AppDimensions.md),
                    );
                  },
                ),
              ),
            )
          ]),
        ):const SizedBox() : const BannerShimmer();
      },
    );
  }


}
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}