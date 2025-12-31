import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/features/map/controllers/map_controller.dart';
import 'package:rapidito_user/features/wallet/widget/custom_title.dart';
import 'package:rapidito_user/theme/theme_controller.dart';
import 'package:rapidito_user/util/dimensions.dart';
import 'package:rapidito_user/features/home/widgets/banner_shimmer.dart';
import 'package:rapidito_user/features/location/controllers/location_controller.dart';


class HomeMapView extends StatefulWidget {
  final String title;
  const HomeMapView({super.key, required this.title});

  @override
  HomeMapViewState createState() => HomeMapViewState();
}

class HomeMapViewState extends State<HomeMapView> {
  GoogleMapController? _mapController;
  int isFirstCount = 0;


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<MapController>(builder: (mapController) {
      return GetBuilder<LocationController>(builder: (locationController) {
        Completer<GoogleMapController> mapCompleter = Completer<GoogleMapController>();
        if(mapController.mapController != null) {
          mapCompleter.complete(mapController.mapController);
        }
        return mapController.nearestDeliveryManMarkers != null ?
        Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.paddingMD,
            left: AppDimensions.paddingMD,
            right: AppDimensions.paddingMD,
          ),
          child: Column(children: [
            Text(
              widget.title.tr,
              style: AppTextStyles.headingLarge.copyWith(
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            const SizedBox(height: AppDimensions.md),

            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                  width: 1.5,
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
                child: GoogleMap(
                  style: isDarkMode ?
                  Get.find<ThemeController>().darkMap :
                  Get.find<ThemeController>().lightMap,
                  markers: mapController.nearestDeliveryManMarkers!.toSet(),
                  initialCameraPosition: CameraPosition(target: LatLng(
                    Get.find<LocationController>().getUserAddress()?.latitude ?? 0,
                    Get.find<LocationController>().getUserAddress()?.longitude ?? 0,
                  ), zoom: 13),
                   minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
                  onMapCreated: (gController) {
                    _mapController = gController;
                    mapController.setMapController(gController);
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: false,
                ),
              ),
            ),
          ]),
        ) :
        const BannerShimmer();
      });
    });
  }
}
