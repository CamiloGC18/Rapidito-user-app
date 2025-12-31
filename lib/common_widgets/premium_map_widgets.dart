import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';

/// Widget para controles de zoom premium del mapa
class PremiumMapControls extends StatelessWidget {
  final GoogleMapController? mapController;
  final VoidCallback? onLocationPressed;
  final VoidCallback? onTrafficToggled;
  final bool isTrafficEnabled;

  const PremiumMapControls({
    super.key,
    this.mapController,
    this.onLocationPressed,
    this.onTrafficToggled,
    this.isTrafficEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Zoom In Button
        _buildControlButton(
          icon: Icons.add,
          onPressed: () {
            mapController?.animateCamera(
              CameraUpdate.zoomIn(),
            );
          },
        ),
        const SizedBox(height: AppDimensions.md),

        // Zoom Out Button
        _buildControlButton(
          icon: Icons.remove,
          onPressed: () {
            mapController?.animateCamera(
              CameraUpdate.zoomOut(),
            );
          },
        ),
        const SizedBox(height: AppDimensions.md),

        // Traffic Toggle Button
        _buildControlButton(
          icon: isTrafficEnabled ? Icons.traffic : Icons.traffic_rounded,
          onPressed: onTrafficToggled,
          isActive: isTrafficEnabled,
        ),
        const SizedBox(height: AppDimensions.md),

        // Current Location Button
        _buildControlButton(
          icon: Icons.my_location_rounded,
          onPressed: onLocationPressed,
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback? onPressed,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary
              : Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: isActive
              ? Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                  width: 1.5,
                )
              : null,
        ),
        child: Center(
          child: Icon(
            icon,
            color: isActive ? Colors.white : AppColors.primary,
            size: 24,
          ),
        ),
      ),
    );
  }
}

/// Widget para información del marcador (Info Window)
class PremiumMapInfoWindow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? distance;
  final String? eta;
  final IconData? icon;
  final Color? backgroundColor;

  const PremiumMapInfoWindow({
    super.key,
    required this.title,
    this.subtitle,
    this.distance,
    this.eta,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 250,
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDarkMode ? AppColors.darkCard : AppColors.lightCard),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with icon
          Row(
            children: [
              if (icon != null)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                    size: 18,
                  ),
                ),
              if (icon != null) const SizedBox(width: AppDimensions.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDarkMode
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: AppDimensions.xs),
                        child: Text(
                          subtitle!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: isDarkMode
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          // Distance and ETA
          if (distance != null || eta != null)
            Padding(
              padding: const EdgeInsets.only(top: AppDimensions.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (distance != null)
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'distance'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: isDarkMode
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary,
                                ),
                          ),
                          Text(
                            distance!,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  if (eta != null)
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'eta'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: isDarkMode
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary,
                                ),
                          ),
                          Text(
                            eta!,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.success,
                                ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Widget para marcador personalizado con animación
class AnimatedMapMarker extends StatefulWidget {
  final LatLng position;
  final String label;
  final Color color;
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool animate;

  const AnimatedMapMarker({
    super.key,
    required this.position,
    required this.label,
    required this.color,
    this.imageUrl,
    this.onTap,
    this.animate = true,
  });

  @override
  State<AnimatedMapMarker> createState() => _AnimatedMapMarkerState();
}

class _AnimatedMapMarkerState extends State<AnimatedMapMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
      _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
      );
      _controller.forward();
    }
  }

  @override
  void dispose() {
    if (widget.animate) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) {
      return _buildMarkerContent();
    }

    return ScaleTransition(
      scale: _scaleAnimation,
      child: _buildMarkerContent(),
    );
  }

  Widget _buildMarkerContent() {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
