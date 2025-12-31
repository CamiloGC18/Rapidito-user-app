import 'package:flutter/material.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:shimmer/shimmer.dart';

/// Widget reutilizable para efecto shimmer/esqueleto loading
class PremiumShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool isCircular;

  const PremiumShimmer({
    super.key,
    this.width = double.infinity,
    this.height = 20,
    this.borderRadius,
    this.margin,
    this.padding,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDarkMode
          ? AppColors.darkCard.withOpacity(0.8)
          : AppColors.lightCard.withOpacity(0.5),
      highlightColor: isDarkMode
          ? AppColors.darkCard.withOpacity(0.3)
          : Colors.white.withOpacity(0.7),
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: isCircular
              ? null
              : borderRadius ?? BorderRadius.circular(AppDimensions.radiusMD),
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }
}

/// Shimmer para tarjetas/cards
class PremiumShimmerCard extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  const PremiumShimmerCard({
    super.key,
    this.width,
    this.height = 200,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDarkMode
          ? AppColors.darkCard.withOpacity(0.8)
          : AppColors.lightCard.withOpacity(0.5),
      highlightColor: isDarkMode
          ? AppColors.darkCard.withOpacity(0.3)
          : Colors.white.withOpacity(0.7),
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: padding,
        margin: EdgeInsets.only(bottom: AppDimensions.md),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        ),
      ),
    );
  }
}

/// Shimmer para listas horizontales
class PremiumShimmerList extends StatelessWidget {
  final int itemCount;
  final double itemWidth;
  final double itemHeight;
  final Axis scrollDirection;

  const PremiumShimmerList({
    super.key,
    this.itemCount = 5,
    this.itemWidth = 150,
    this.itemHeight = 120,
    this.scrollDirection = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: AppDimensions.md),
            child: PremiumShimmerCard(
              width: itemWidth,
              height: itemHeight,
            ),
          );
        },
      ),
    );
  }
}

/// Shimmer para avatar circular
class PremiumShimmerAvatar extends StatelessWidget {
  final double size;
  final EdgeInsets? margin;

  const PremiumShimmerAvatar({
    super.key,
    this.size = 56,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumShimmer(
      width: size,
      height: size,
      isCircular: true,
      margin: margin,
    );
  }
}

/// Shimmer para línea de texto (similar a un párrafo)
class PremiumShimmerLine extends StatelessWidget {
  final double width;
  final double height;
  final int lineCount;
  final EdgeInsets? margin;

  const PremiumShimmerLine({
    super.key,
    this.width = double.infinity,
    this.height = 12,
    this.lineCount = 1,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        lineCount,
        (index) => Padding(
          padding: margin ?? EdgeInsets.only(bottom: AppDimensions.sm),
          child: PremiumShimmer(
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
