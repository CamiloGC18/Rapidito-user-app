import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';

/// Widget para mostrar información de ruta/viaje en el mapa
class RouteInfoPanel extends StatelessWidget {
  final String pickup;
  final String destination;
  final String? distance;
  final String? estimatedTime;
  final String? fare;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isLoading;

  const RouteInfoPanel({
    super.key,
    required this.pickup,
    required this.destination,
    this.distance,
    this.estimatedTime,
    this.fare,
    this.onConfirm,
    this.onCancel,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusXL),
          topRight: Radius.circular(AppDimensions.radiusXL),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppDimensions.lg),

            // Pickup and Destination
            _buildLocationRow(
              context,
              icon: Icons.location_on_rounded,
              color: AppColors.primary,
              title: 'Pickup',
              address: pickup,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.md),
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: AppDimensions.md),
                    child: SizedBox(
                      width: 2,
                      height: 40,
                      child: Container(
                        color: AppColors.primary.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox.shrink()),
                ],
              ),
            ),
            _buildLocationRow(
              context,
              icon: Icons.flag_rounded,
              color: AppColors.success,
              title: 'Destination',
              address: destination,
            ),

            const SizedBox(height: AppDimensions.lg),

            // Trip details grid
            if (distance != null || estimatedTime != null || fare != null)
              Container(
                padding: EdgeInsets.all(AppDimensions.paddingMD),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.1),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (distance != null) _buildDetailCard(context, 'distance', distance!, Icons.straighten_rounded),
                    if (estimatedTime != null)
                      _buildDetailCard(context, 'eta', estimatedTime!, Icons.schedule_rounded),
                    if (fare != null) _buildDetailCard(context, 'fare', fare!, Icons.currency_exchange_rounded),
                  ],
                ),
              ),

            const SizedBox(height: AppDimensions.lg),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (onCancel != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: onCancel,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.md,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.3),
                            width: 1.5,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusMD),
                        ),
                        child: Text(
                          'cancel'.tr,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                if (onCancel != null && onConfirm != null)
                  const SizedBox(width: AppDimensions.md),
                if (onConfirm != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: isLoading ? null : onConfirm,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.md,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusMD),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: isLoading
                            ? SizedBox(
                                height: 20,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white.withOpacity(0.7),
                                  ),
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'confirm'.tr,
                                style: AppTextStyles.labelMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String title,
    required String address,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: AppDimensions.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.labelSmall.copyWith(
                  color: isDarkMode
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
              const SizedBox(height: AppDimensions.xs),
              Text(
                address,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDarkMode
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(height: AppDimensions.xs),
        Text(
          label.tr,
          style: AppTextStyles.labelSmall.copyWith(
            color: isDarkMode
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: AppDimensions.xs),
        Text(
          value,
          style: AppTextStyles.labelMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: isDarkMode
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary,
          ),
        ),
      ],
    );
  }
}

/// Widget para mostrar estado de búsqueda de conductor
class DriverSearchingPanel extends StatefulWidget {
  final String message;
  final bool isSearching;
  final VoidCallback? onCancel;

  const DriverSearchingPanel({
    super.key,
    required this.message,
    this.isSearching = true,
    this.onCancel,
  });

  @override
  State<DriverSearchingPanel> createState() => _DriverSearchingPanelState();
}

class _DriverSearchingPanelState extends State<DriverSearchingPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (widget.isSearching) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(DriverSearchingPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSearching && !_controller.isAnimating) {
      _controller.repeat(reverse: true);
    } else if (!widget.isSearching && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
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
        children: [
          // Animated pulse icon
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.person_search_rounded,
                color: AppColors.primary,
                size: 28,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.lg),

          // Message
          Text(
            widget.message,
            style: AppTextStyles.headingMedium.copyWith(
              color: isDarkMode
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppDimensions.md),

          // Loading dots animation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => ScaleTransition(
                scale: Tween<double>(begin: 0.5, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      index * 0.3,
                      (index + 1) * 0.3 + 0.3,
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),

          if (widget.onCancel != null) ...[
            const SizedBox(height: AppDimensions.lg),
            GestureDetector(
              onTap: widget.onCancel,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.md,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.error.withOpacity(0.3),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                ),
                child: Text(
                  'cancel_search'.tr,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
