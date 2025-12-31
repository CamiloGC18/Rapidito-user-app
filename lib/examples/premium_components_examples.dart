import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidito_user/config/app_colors.dart';
import 'package:rapidito_user/config/app_dimensions.dart';
import 'package:rapidito_user/config/app_text_styles.dart';
import 'package:rapidito_user/common_widgets/premium_button.dart';
import 'package:rapidito_user/common_widgets/premium_card.dart';
import 'package:rapidito_user/common_widgets/premium_text_field.dart';
import 'package:rapidito_user/common_widgets/premium_shimmer.dart';
import 'package:rapidito_user/common_widgets/empty_state_widget.dart';
import 'package:rapidito_user/common_widgets/premium_loader.dart';
import 'package:rapidito_user/common_widgets/premium_dialog.dart';
import 'package:rapidito_user/common_widgets/premium_animations.dart';

/// 📚 EJEMPLOS DE USO - COMPONENTES PREMIUM RAPIDITO
///
/// Este archivo contiene ejemplos de uso para todos los componentes
/// reutilizables creados en el rediseño FASE 1-4

class PremiumComponentsExamples extends StatefulWidget {
  const PremiumComponentsExamples({super.key});

  @override
  State<PremiumComponentsExamples> createState() => _PremiumComponentsExamplesState();
}

class _PremiumComponentsExamplesState extends State<PremiumComponentsExamples> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('🎨 Premium Components'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Colors & Text'),
              Tab(text: 'Forms'),
              Tab(text: 'Loading'),
              Tab(text: 'Empty States'),
              Tab(text: 'Animations'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildColorsAndTextTab(),
            _buildFormsTab(),
            _buildLoadingTab(),
            _buildEmptyStatesTab(),
            _buildAnimationsTab(),
          ],
        ),
      ),
    );
  }

  // TAB 1: Colors and Typography
  Widget _buildColorsAndTextTab() {
    return ListView(
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      children: [
        // Paleta de colores
        Text(
          'Color Palette',
          style: AppTextStyles.headingLarge,
        ),
        const SizedBox(height: AppDimensions.md),

        // Primary Color
        PremiumCard(
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                ),
              ),
              const SizedBox(width: AppDimensions.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Primary', style: AppTextStyles.labelMedium),
                  Text('#00D9C0', style: AppTextStyles.bodySmall),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.md),

        // Semantic Colors
        Row(
          children: [
            Expanded(
              child: PremiumCard(
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.sm),
                    Text('Success', style: AppTextStyles.labelSmall),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: PremiumCard(
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.warning,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.sm),
                    Text('Warning', style: AppTextStyles.labelSmall),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: PremiumCard(
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.sm),
                    Text('Error', style: AppTextStyles.labelSmall),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.lg),

        // Typography Styles
        Text(
          'Typography System',
          style: AppTextStyles.headingLarge,
        ),
        const SizedBox(height: AppDimensions.md),
        Text('Display Large', style: AppTextStyles.displayLarge),
        const SizedBox(height: AppDimensions.sm),
        Text('Heading Large', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.sm),
        Text('Body Medium', style: AppTextStyles.bodyMedium),
        const SizedBox(height: AppDimensions.sm),
        Text('Body Small', style: AppTextStyles.bodySmall),
        const SizedBox(height: AppDimensions.sm),
        Text('Label Medium', style: AppTextStyles.labelMedium),

        const SizedBox(height: AppDimensions.lg),

        // Spacing Grid
        Text(
          'Spacing Grid (8pt)',
          style: AppTextStyles.headingLarge,
        ),
        const SizedBox(height: AppDimensions.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppDimensions.sm),
                Text('XS (4px)', style: AppTextStyles.labelSmall),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppDimensions.sm),
                Text('SM (8px)', style: AppTextStyles.labelSmall),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppDimensions.sm),
                Text('MD (16px)', style: AppTextStyles.labelSmall),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppDimensions.sm),
                Text('LG (24px)', style: AppTextStyles.labelSmall),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // TAB 2: Forms
  Widget _buildFormsTab() {
    return ListView(
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      children: [
        Text('Form Components', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),

        // Premium Text Field
        PremiumTextField(
          label: 'Full Name',
          hintText: 'Enter your name',
          onChanged: (value) {},
        ),
        const SizedBox(height: AppDimensions.md),

        // Premium Text Field with Error
        PremiumTextField(
          label: 'Email',
          hintText: 'Enter your email',
          errorText: 'Invalid email format',
        ),
        const SizedBox(height: AppDimensions.lg),

        // Premium Card
        Text('Card Component', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),
        PremiumCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card Title', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppDimensions.sm),
              Text(
                'This is a reusable premium card with automatic styling',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.md),

        // Glassmorphic Card
        Text('Glassmorphic Card', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary.withOpacity(0.2), AppColors.primary.withOpacity(0.05)],
            ),
          ),
          padding: EdgeInsets.all(AppDimensions.paddingMD),
          child: Text('Glassmorphic effect demo', style: AppTextStyles.bodyMedium),
        ),
        const SizedBox(height: AppDimensions.lg),

        // Premium Buttons
        Text('Buttons', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),
        Row(
          children: [
            Expanded(
              child: PremiumButton(
                onPressed: () => _showSnackBar('Primary Button'),
                label: 'Primary',
              ),
            ),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: PremiumButton(
                onPressed: () => _showSnackBar('Secondary Button'),
                label: 'Secondary',
                isOutlined: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.md),
        PremiumButton(
          onPressed: () {
            setState(() => isLoading = !isLoading);
            Future.delayed(const Duration(seconds: 2), () {
              setState(() => isLoading = false);
              _showSnackBar('Action completed!');
            });
          },
          label: isLoading ? 'Loading...' : 'With Loading',
          isLoading: isLoading,
          fullWidth: true,
        ),
      ],
    );
  }

  // TAB 3: Loading States
  Widget _buildLoadingTab() {
    return ListView(
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      children: [
        Text('Shimmer Loaders', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),

        PremiumShimmerCard(height: 150),
        const SizedBox(height: AppDimensions.md),

        Row(
          children: [
            PremiumShimmerAvatar(size: 56),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: Column(
                children: [
                  PremiumShimmerLine(width: double.infinity, height: 12),
                  const SizedBox(height: AppDimensions.sm),
                  PremiumShimmerLine(width: 200, height: 12),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.lg),

        Text('Premium Loaders', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),

        Center(
          child: PremiumLoader(
            size: 50,
            type: LoaderType.circle,
            message: 'Loading...',
          ),
        ),
        const SizedBox(height: AppDimensions.lg),

        Center(
          child: ProgressCircleLoader(
            progress: 0.65,
            size: 120,
            percentage: '65%',
          ),
        ),
        const SizedBox(height: AppDimensions.lg),

        PremiumProgressBar(
          progress: 0.75,
          showPercentage: true,
        ),
      ],
    );
  }

  // TAB 4: Empty States
  Widget _buildEmptyStatesTab() {
    return ListView(
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      children: [
        Center(
          child: NoDataEmptyState(
            title: 'No Rides Yet',
            subtitle: 'Book your first ride to get started',
            onRetry: () => _showSnackBar('Retrying...'),
          ),
        ),
        const SizedBox(height: AppDimensions.lg),
        Center(
          child: NoInternetEmptyState(
            onRetry: () => _showSnackBar('Reconnecting...'),
          ),
        ),
      ],
    );
  }

  // TAB 5: Animations
  Widget _buildAnimationsTab() {
    return ListView(
      padding: EdgeInsets.all(AppDimensions.paddingMD),
      children: [
        Text('Entrance Animations', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),

        FadeInAnimation(
          child: PremiumCard(
            child: Text('Fade In Animation', style: AppTextStyles.bodyMedium),
          ),
        ),
        const SizedBox(height: AppDimensions.md),

        ScaleInAnimation(
          child: PremiumCard(
            child: Text('Scale In Animation', style: AppTextStyles.bodyMedium),
          ),
        ),
        const SizedBox(height: AppDimensions.md),

        SlideInAnimation(
          direction: SlideDirection.fromLeft,
          child: PremiumCard(
            child: Text('Slide In Animation', style: AppTextStyles.bodyMedium),
          ),
        ),
        const SizedBox(height: AppDimensions.lg),

        Text('Pulse Effect', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),

        PulseAnimation(
          child: Container(
            padding: EdgeInsets.all(AppDimensions.paddingMD),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
              border: Border.all(color: AppColors.primary),
            ),
            child: Text(
              'Pulsing Element',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.lg),

        Text('Staggered List', style: AppTextStyles.headingLarge),
        const SizedBox(height: AppDimensions.md),

        StaggeredAnimationList(
          children: List.generate(
            3,
            (index) => PremiumCard(
              child: Text('Item ${index + 1}', style: AppTextStyles.bodyMedium),
            ),
          ),
        ),

        const SizedBox(height: AppDimensions.lg),

        Center(
          child: ElevatedButton(
            onPressed: () => _showDialogExample(),
            child: const Text('Show Dialog Example'),
          ),
        ),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _showDialogExample() {
    PremiumDialog.showConfirmation(
      title: 'Confirm Action',
      message: 'Are you sure you want to proceed?',
      confirmText: 'Yes, Proceed',
      cancelText: 'Cancel',
    ).then((result) {
      if (result == true) {
        _showSnackBar('Action confirmed!');
      }
    });
  }
}
