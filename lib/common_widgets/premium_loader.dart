import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';

/// Widget premium para loaders/spinners personalizados
class PremiumLoader extends StatelessWidget {
  final double size;
  final Color? color;
  final LoaderType type;
  final String? message;
  final TextStyle? messageStyle;

  const PremiumLoader({
    super.key,
    this.size = 50,
    this.color,
    this.type = LoaderType.circle,
    this.message,
    this.messageStyle,
  });

  @override
  Widget build(BuildContext context) {
    final loaderColor = color ?? AppColors.primary;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLoader(loaderColor),
          if (message != null) ...[
            const SizedBox(height: AppDimensions.md),
            Text(
              message!,
              style: messageStyle ??
                  TextStyle(
                    color: loaderColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLoader(Color color) {
    switch (type) {
      case LoaderType.circle:
        return SpinKitCircle(color: color, size: size);
      case LoaderType.ring:
        return SpinKitRing(color: color, size: size);
      case LoaderType.wave:
        return SpinKitWave(color: color, size: size);
      case LoaderType.wave2:
        return SpinKitWave(color: color, size: size, type: SpinKitWaveType.end);
      case LoaderType.fadingCircle:
        return SpinKitFadingCircle(color: color, size: size);
      case LoaderType.fadingCube:
        return SpinKitFadingCube(color: color, size: size);
      case LoaderType.pulse:
        return SpinKitPulse(color: color, size: size);
      case LoaderType.doubleBounce:
        return SpinKitDoubleBounce(color: color, size: size);
      case LoaderType.rotatingCircle:
        return SpinKitRotatingCircle(color: color, size: size);
      case LoaderType.ripple:
        return SpinKitRipple(
          color: color,
          size: size,
          borderWidth: 2,
        );
    }
  }
}

enum LoaderType {
  circle,
  ring,
  wave,
  wave2,
  fadingCircle,
  fadingCube,
  pulse,
  doubleBounce,
  rotatingCircle,
  ripple,
}

/// Loader circular con porcentaje (para descargas/subidas)
class ProgressCircleLoader extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final Color? backgroundColor;
  final Color? progressColor;
  final String? percentage;
  final Widget? centerChild;

  const ProgressCircleLoader({
    super.key,
    required this.progress,
    this.size = 100,
    this.backgroundColor,
    this.progressColor,
    this.percentage,
    this.centerChild,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = backgroundColor ?? AppColors.primary.withOpacity(0.1);
    final pColor = progressColor ?? AppColors.primary;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
          ),

          // Progress circle
          CustomPaint(
            painter: CircleProgressPainter(
              progress: progress,
              color: pColor,
              width: 4,
            ),
            size: Size(size, size),
          ),

          // Center content
          centerChild ??
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (percentage != null)
                    Text(
                      percentage!,
                      style: TextStyle(
                        color: isDarkMode
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
        ],
      ),
    );
  }
}

/// Custom painter para círculo de progreso
class CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double width;

  CircleProgressPainter({
    required this.progress,
    required this.color,
    this.width = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (width / 2);

    // Draw background circle
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = color.withOpacity(0.1)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );

    // Draw progress arc
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    final sweepAngle = (progress * 360) * (3.14159 / 180);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159 / 2, // Start from top
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircleProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// Loader lineal con progreso (progress bar)
class PremiumProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double height;
  final Color? backgroundColor;
  final Color? progressColor;
  final BorderRadius? borderRadius;
  final bool showPercentage;
  final TextStyle? percentageStyle;

  const PremiumProgressBar({
    super.key,
    required this.progress,
    this.height = 8,
    this.backgroundColor,
    this.progressColor,
    this.borderRadius,
    this.showPercentage = false,
    this.percentageStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = backgroundColor ?? AppColors.primary.withOpacity(0.15);
    final pColor = progressColor ?? AppColors.primary;
    final radius = borderRadius ?? BorderRadius.circular(height / 2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: radius,
          child: SizedBox(
            width: double.infinity,
            height: height,
            child: Container(
              color: bgColor,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity * progress,
                    height: height,
                    decoration: BoxDecoration(
                      color: pColor,
                      borderRadius: radius,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showPercentage)
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.sm),
            child: Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: percentageStyle ??
                  TextStyle(
                    color: isDarkMode
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
      ],
    );
  }
}

/// Skeleton/Esqueleto loader animado
class SkeletonLoader extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final Duration duration;

  const SkeletonLoader({
    super.key,
    required this.child,
    this.isLoading = true,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: 0.5 + (_animation.value * 0.5),
          child: widget.child,
        );
      },
    );
  }
}
