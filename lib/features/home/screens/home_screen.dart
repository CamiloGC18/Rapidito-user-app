import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/features/auth/controllers/auth_controller.dart';
import 'package:rapidito_user/features/home/widgets/banner_view.dart';
import 'package:rapidito_user/features/home/widgets/best_offers_widget.dart';
import 'package:rapidito_user/features/home/widgets/category_view.dart';
import 'package:rapidito_user/features/home/widgets/coupon_home_widget.dart';
import 'package:rapidito_user/features/home/widgets/home_map_view.dart';
import 'package:rapidito_user/features/home/widgets/home_search_widget.dart';
import 'package:rapidito_user/features/home/widgets/home_referral_view_widget.dart';
import 'package:rapidito_user/features/home/widgets/visit_to_mart_widget.dart';
import 'package:rapidito_user/features/my_offer/controller/offer_controller.dart';
import 'package:rapidito_user/features/parcel/controllers/parcel_controller.dart';
import 'package:rapidito_user/features/parcel/screens/parcel_list_view_screen.dart';
import 'package:rapidito_user/features/parcel/widgets/driver_request_dialog.dart';
import 'package:rapidito_user/features/ride/screens/ride_list_view_screen.dart';
import 'package:rapidito_user/features/splash/controllers/config_controller.dart';
import 'package:rapidito_user/features/splash/domain/models/config_model.dart';
import 'package:rapidito_user/helper/home_screen_helper.dart';
import 'package:rapidito_user/helper/pusher_helper.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/util/images.dart';
import 'package:rapidito_user/util/styles.dart';
import 'package:rapidito_user/features/address/controllers/address_controller.dart';
import 'package:rapidito_user/features/home/controllers/banner_controller.dart';
import 'package:rapidito_user/features/home/controllers/category_controller.dart';
import 'package:rapidito_user/features/home/widgets/home_my_address.dart';
import 'package:rapidito_user/features/location/controllers/location_controller.dart';
import 'package:rapidito_user/features/profile/controllers/profile_controller.dart';
import 'package:rapidito_user/features/ride/controllers/ride_controller.dart';
import 'package:rapidito_user/common_widgets/app_bar_widget.dart';
import 'package:rapidito_user/common_widgets/body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  JustTheController rideShareToolTip = JustTheController();
  JustTheController parcelDeliveryToolTip = JustTheController();
  final ScrollController _scrollController = ScrollController();
  bool _isShowRideIcon = true;


  String greetingMessage() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return 'good_morning'.tr;
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'good_afternoon'.tr;
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'good_evening'.tr;
    } else {
      return 'good_night'.tr;
    }
  }

  String getGreetingEmoji() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return '👋';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return '😊';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return '🌆';
    } else {
      return '🌙';
    }
  }

  @override
  void initState() {
    super.initState();
    Get.find<AddressController>().updateLastLocation();

    _scrollController.addListener((){
      if(_scrollController.offset > 20){
        setState(() {
          _isShowRideIcon = false;
        });

      }else{
        setState(() {
          _isShowRideIcon = true;
        });

      }
    });

    loadData();
  }

  @override
  void dispose() {
    rideShareToolTip.dispose();
    parcelDeliveryToolTip.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool clickedMenu = false;
  Future<void> loadData({bool isReload = false}) async{

    if(isReload) {
      Get.find<ConfigController>().getConfigData();
    }

    Get.find<ParcelController>().getUnpaidParcelList();
    Get.find<BannerController>().getBannerList();
    Get.find<CategoryController>().getCategoryList();
    Get.find<AddressController>().getAddressList(1);
    Get.find<CategoryController>().setCouponFilterIndex(0, isUpdate: false);
    Get.find<OfferController>().getOfferList(1);

    if(Get.find<ProfileController>().profileModel == null){
      Get.find<ProfileController>().getProfileInfo();
    }

    await Get.find<RideController>().getRunningRideList();
    if(Get.find<RideController>().runningRideList?.data != null){
      for(var element in Get.find<RideController>().runningRideList!.data!){
        PusherHelper().pusherDriverStatus(element.id!);
      }
    }

    await Get.find<RideController>().getCurrentRegularRide();
    if(Get.find<RideController>().rideDetails != null){
      Get.find<RideController>().getBiddingList(Get.find<RideController>().rideDetails!.id!, 1);
    }else{
      Get.find<RideController>().clearBiddingList();
    }

    await Get.find<ParcelController>().getRunningParcelList();
    if(Get.find<ParcelController>().parcelListModel!.data!.isNotEmpty){
      for (var element in Get.find<ParcelController>().parcelListModel!.data!) {
        PusherHelper().pusherDriverStatus(element.id!);
      }
    }

    await Get.find<RideController>().getNearestDriverList(
      Get.find<LocationController>().getUserAddress()!.latitude!.toString(),
      Get.find<LocationController>().getUserAddress()!.longitude!.toString(),
    );

    HomeScreenHelper.checkMaintanceMode();
  }


  @override
  Widget build(BuildContext context) {
    ConfigModel? config = Get.find<ConfigController>().config;

    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (profileController) {
        return GetBuilder<RideController>(builder: (rideController) {
          return GetBuilder<ParcelController>(builder: (parcelController) {
            final isDarkMode = Theme.of(context).brightness == Brightness.dark;
            
            return BodyWidget(
              appBar: AppBarWidget(
                title: '${getGreetingEmoji()} ${greetingMessage()}',
                subTitle: profileController.customerFirstName(),
                showBackButton: false,
                isHome: true,
                fontSize: Dimensions.fontSizeLarge,
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  await loadData(isReload: true);
                },
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top:Dimensions.paddingSize,left: Dimensions.paddingSize,
                          right: Dimensions.paddingSize,
                        ),
                        child: Column(children: [
                          const BannerView(),

                          const Padding(
                            padding: EdgeInsets.only(top:Dimensions.paddingSize),
                            child: CategoryView(),
                          ),

                          if((config?.externalSystem ?? false) && Get.find<AuthController>().isLoggedIn())...[
                            const VisitToMartWidget(),
                            const SizedBox(height: Dimensions.paddingSizeDefault)
                          ],

                          const HomeSearchWidget(),
                        ]),
                      ),
                      const SizedBox(height:Dimensions.paddingSizeDefault),

                      const HomeMyAddress(addressPage: AddressPage.home),

                      const Padding(
                        padding: EdgeInsets.only(
                          top:Dimensions.paddingSize,left: Dimensions.paddingSize,
                          right: Dimensions.paddingSize,
                        ),
                        child: HomeMapView(title: 'rider_around_you'),
                      ),

                      if(config?.referralEarningStatus ?? false)
                        const HomeReferralViewWidget(),

                      const BestOfferWidget(),

                      const HomeCouponWidget(),

                      const SizedBox(height: 100)
                    ])),
                  ],
                ),
              ),
            );
          });
        });
      }),
      floatingActionButton: GetBuilder<RideController>(builder: (rideController){
        if(Get.find<ConfigController>().isShowToolTips){
          showToolTips();
        }
        return Column(mainAxisSize:MainAxisSize.min, children: [
          (Get.find<ParcelController>().parcelListModel?.totalSize ?? 0) > 0 && _isShowRideIcon ?
          Padding(
            padding: EdgeInsets.only(
                bottom:rideController.biddingList.isEmpty && ((rideController.runningRideList?.data?.length ?? 0) == 0) ? Get.height * 0.08 : 0
            ),
            child: JustTheTooltip(
              backgroundColor: AppColors.primary,
              controller: parcelDeliveryToolTip,
              preferredDirection: AxisDirection.right,
              tailLength: 10,
              tailBaseWidth: 20,
              content: Container(
                width: 150,
                padding: AppDimensions.paddingSM,
                child: Text(
                  'parcel_delivery'.tr,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              child: InkWell(
                onTap: ()=> Get.to(()=> const ParcelListViewScreen(title: 'ongoing_parcel_list')),
                child: Stack(children: [
                  // Container premium con elevation
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        Images.parcelDeliveryIcon,
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),

                  // Badge premium
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.error,
                        border: Border.all(
                          color: Get.isDarkMode ? AppColors.darkCard : AppColors.lightCard,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.error.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${Get.find<ParcelController>().parcelListModel?.totalSize}',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ) :
          const SizedBox(),
          const SizedBox(height: Dimensions.paddingSizeSmall),

          (rideController.runningRideList?.data?.length ?? 0) > 0 && _isShowRideIcon ?
          Padding(
            padding: EdgeInsets.only(bottom: rideController.biddingList.isEmpty ? Get.height * 0.08 : 0),
            child: JustTheTooltip(
              backgroundColor: AppColors.primary,
              controller: rideShareToolTip,
              preferredDirection: AxisDirection.right,
              tailLength: 10,
              tailBaseWidth: 20,
              content: Container(
                width: 100,
                padding: AppDimensions.paddingSM,
                child: Text(
                  'ride_share'.tr,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              child: InkWell(
                onTap: ()=> Get.to(()=> const RideListViewScreen()),
                child: Stack(children: [
                  // Container premium con elevation
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        Images.rideShareIcon,
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),

                  // Badge premium
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.error,
                        border: Border.all(
                          color: Get.isDarkMode ? AppColors.darkCard : AppColors.lightCard,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.error.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${rideController.runningRideList?.data?.length}',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ) :
          const SizedBox(),

          rideController.biddingList.isNotEmpty && _isShowRideIcon ?
          Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.08),
            child: InkWell(
              onTap: (){
                if(!rideController.isLoading){
                  rideController.getBiddingList(
                      rideController.rideDetails!.id!, 1
                  ).then((value) {
                    if(rideController.biddingList.isNotEmpty){

                      Get.dialog(
                          barrierDismissible: true,
                          barrierColor: Colors.black.withValues(alpha:0.5),
                          transitionDuration: const Duration(milliseconds: 500),
                          DriverRideRequestDialog(tripId: Get.find<RideController>().rideDetails!.id!)
                      );
                    }
                  });
                }
              },
              child: Stack(children: [
                // Container premium con elevation
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      Images.biddingIcon,
                      width: 28,
                      height: 28,
                    ),
                  ),
                ),

                // Badge premium - indicador de animación
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.error,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.error.withOpacity(0.5),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ) :
          const SizedBox()
        ]);
      }),
    );
  }

  void showToolTips(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      Future.delayed(const Duration(seconds: 1)).then((_){
        int ridingCount = (Get.find<RideController>().runningRideList?.data?.length ?? 0);
        int parcelCount = Get.find<ParcelController>().parcelListModel?.totalSize ?? 0;
        if(ridingCount > 0 && _isShowRideIcon){
          rideShareToolTip.showTooltip();
          Get.find<ConfigController>().hideToolTips();
          Future.delayed(const Duration(seconds: 5)).then((_){
            rideShareToolTip.hideTooltip();
          });
        }

        if(parcelCount > 0 && _isShowRideIcon){
          parcelDeliveryToolTip.showTooltip();
          Get.find<ConfigController>().hideToolTips();
          Future.delayed(const Duration(seconds: 5)).then((_){
            parcelDeliveryToolTip.hideTooltip();
          });
        }

      });
    });
  }

}




