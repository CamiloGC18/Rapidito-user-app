# 🚀 GUÍA RÁPIDA - COMPONENTES PREMIUM RAPIDITO

## ⚡ Inicio Rápido

### Colores
```dart
import 'package:rapidito_user/config/app_colors.dart';

Color primary = AppColors.primary;           // #00D9C0
Color success = AppColors.success;           // #10B981
Color warning = AppColors.warning;           // #F59E0B
Color error = AppColors.error;               // #EF4444
Color info = AppColors.info;                 // #3B82F6

// Dark mode automático
Color surfaceColor = AppColors.cardBackground;  // Adapta a tema
Color textPrimary = AppColors.textPrimary;      // Automático
```

### Espaciado
```dart
import 'package:rapidito_user/config/app_dimensions.dart';

// Grid 8pt
EdgeInsets padding = EdgeInsets.all(AppDimensions.paddingMD);  // 16px
EdgeInsets margin = EdgeInsets.symmetric(
  horizontal: AppDimensions.md,  // 16px
  vertical: AppDimensions.sm,    // 8px
);

// Valores
AppDimensions.xs      // 4px
AppDimensions.sm      // 8px
AppDimensions.md      // 16px
AppDimensions.lg      // 24px
AppDimensions.xl      // 32px
AppDimensions.xxl     // 48px

// Border radius
BorderRadius.circular(AppDimensions.radiusMD)  // 12px
```

### Tipografía
```dart
import 'package:rapidito_user/config/app_text_styles.dart';

Text('Display', style: AppTextStyles.displayLarge);
Text('Heading', style: AppTextStyles.headingLarge);
Text('Body', style: AppTextStyles.bodyMedium);
Text('Label', style: AppTextStyles.labelMedium);

// Con color custom
Text(
  'Custom Text',
  style: AppTextStyles.bodyMedium.copyWith(
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  ),
);
```

## 🎨 Componentes Comunes

### Premium Button
```dart
import 'package:rapidito_user/common_widgets/premium_button.dart';

// Básico
PremiumButton(
  label: 'Click Me',
  onPressed: () => print('Clicked'),
);

// Con tamaño
PremiumButton(
  label: 'Large Button',
  size: ButtonSize.large,
  onPressed: () {},
);

// Outline
PremiumButton(
  label: 'Secondary',
  isOutlined: true,
  onPressed: () {},
);

// Con loading
PremiumButton(
  label: isLoading ? 'Loading...' : 'Submit',
  isLoading: isLoading,
  onPressed: () {},
);

// Full width
PremiumButton(
  label: 'Full Width',
  fullWidth: true,
  onPressed: () {},
);

// Color custom
PremiumButton(
  label: 'Custom Color',
  backgroundColor: AppColors.success,
  onPressed: () {},
);
```

### Premium Card
```dart
import 'package:rapidito_user/common_widgets/premium_card.dart';

// Standard
PremiumCard(
  child: Column(
    children: [
      Text('Title', style: AppTextStyles.headingMedium),
      SizedBox(height: AppDimensions.md),
      Text('Content'),
    ],
  ),
);

// Glassmorphic
PremiumCard(
  isGlassmorphic: true,
  borderColor: AppColors.primary,
  child: Text('Frosted effect'),
);

// Con borde custom
PremiumCard(
  borderColor: AppColors.success,
  child: Text('Success card'),
);
```

### Premium Text Field
```dart
import 'package:rapidito_user/common_widgets/premium_text_field.dart';

PremiumTextField(
  label: 'Email',
  hintText: 'user@example.com',
  onChanged: (value) => print(value),
);

// Con error
PremiumTextField(
  label: 'Password',
  hintText: 'Enter password',
  errorText: 'Password required',
);

// Oscuro
PremiumTextField(
  label: 'Search',
  isDarkBackground: true,
);
```

## 📦 Estados de Carga

### Shimmer
```dart
import 'package:rapidito_user/common_widgets/premium_shimmer.dart';

// Genérico
PremiumShimmer(width: 200, height: 100);

// Card
PremiumShimmerCard(height: 150);

// Avatar
PremiumShimmerAvatar(size: 56);

// Línea de texto
PremiumShimmerLine(width: 300, height: 12);

// Lista
PremiumShimmerList(count: 5);
```

### Loaders
```dart
import 'package:rapidito_user/common_widgets/premium_loader.dart';

// Spinner
PremiumLoader(
  size: 50,
  type: LoaderType.circle,
  message: 'Loading...',
);

// Loader circular con progreso
ProgressCircleLoader(
  progress: 0.65,
  size: 120,
  percentage: '65%',
);

// Barra de progreso
PremiumProgressBar(
  progress: 0.75,
  showPercentage: true,
);
```

### Empty States
```dart
import 'package:rapidito_user/common_widgets/empty_state_widget.dart';

// Sin datos
NoDataEmptyState(
  title: 'No Rides',
  subtitle: 'Book your first ride',
  onRetry: () => refresh(),
);

// Sin internet
NoInternetEmptyState(
  onRetry: () => checkConnection(),
);

// Error
ErrorEmptyState(
  title: 'Something went wrong',
  onRetry: () => retry(),
);

// Sin favoritos
NoFavoritesEmptyState(
  onBrowse: () => navigate(),
);
```

## 🎬 Animaciones

### FadeIn
```dart
import 'package:rapidito_user/common_widgets/premium_animations.dart';

FadeInAnimation(
  duration: Duration(milliseconds: 500),
  child: YourWidget(),
);
```

### ScaleIn
```dart
ScaleInAnimation(
  duration: Duration(milliseconds: 300),
  child: YourWidget(),
);
```

### SlideIn
```dart
SlideInAnimation(
  direction: SlideDirection.fromLeft,
  duration: Duration(milliseconds: 400),
  child: YourWidget(),
);
```

### RotateIn
```dart
RotateInAnimation(
  duration: Duration(milliseconds: 600),
  child: YourWidget(),
);
```

### Pulse
```dart
PulseAnimation(
  duration: Duration(milliseconds: 1500),
  child: YourWidget(),
);
```

### Shimmer Animation
```dart
ShimmerAnimation(
  duration: Duration(milliseconds: 2000),
  child: Container(
    color: Colors.grey[300],
    child: YourWidget(),
  ),
);
```

### Staggered List
```dart
StaggeredAnimationList(
  staggerDelay: Duration(milliseconds: 100),
  children: [
    YourWidget1(),
    YourWidget2(),
    YourWidget3(),
  ],
);
```

### Skeleton Loader
```dart
SkeletonLoader(
  width: 200,
  height: 100,
  borderRadius: AppDimensions.radiusMD,
);
```

## 💬 Diálogos

```dart
import 'package:rapidito_user/common_widgets/premium_dialog.dart';

// Confirmación
PremiumDialog.showConfirmation(
  title: 'Delete Ride?',
  message: 'This action cannot be undone',
  isDangerous: true,
).then((confirmed) {
  if (confirmed) { /* delete */ }
});

// Info
PremiumDialog.showInfo(
  title: 'Tip',
  message: 'You can share rides to save money',
);

// Error
PremiumDialog.showError(
  title: 'Error',
  message: 'Something went wrong. Please try again.',
);

// Success
PremiumDialog.showSuccess(
  title: 'Success!',
  message: 'Your ride has been booked',
);

// Bottom Sheet
PremiumDialog.showBottomSheet(
  title: 'Options',
  content: YourWidget(),
);

// Custom
PremiumDialog.showCustom(
  builder: (context) => YourCustomWidget(),
);
```

## 🗺️ Componentes de Mapa

```dart
import 'package:rapidito_user/common_widgets/premium_map_widgets.dart';

// Controles premium del mapa
PremiumMapControls(
  onZoomIn: () {},
  onZoomOut: () {},
  onToggleTraffic: () {},
  onToggleLocation: () {},
);

// Info window
PremiumMapInfoWindow(
  title: 'Pickup Location',
  distance: '2.3 km',
  estimatedTime: '8 mins',
);

// Marcador animado
AnimatedMapMarker(
  position: marker.position,
  infoWindow: InfoWindow(title: marker.title),
);
```

### Configuración de Estilos de Mapa
```dart
import 'package:rapidito_user/config/map_style_config.dart';

// Aplicar estilo claro
await googleMapController?.setMapStyle(
  MapStyleConfig.lightMapStyle,
);

// Aplicar estilo oscuro
await googleMapController?.setMapStyle(
  MapStyleConfig.darkMapStyle,
);

// Helpers
List<Polyline> polylines = MapStyleConfig.createPolylines(
  routePoints,
  polylineId: 'route_1',
);

Marker customMarker = MapStyleConfig.createMarker(
  position,
  markerId: 'custom_1',
  title: 'Marker Title',
);
```

## 📱 Responsive Design

```dart
// Breakpoints
bool isMobile = MediaQuery.of(context).size.width < 600;
bool isTablet = MediaQuery.of(context).size.width >= 600 && 
                MediaQuery.of(context).size.width < 900;
bool isDesktop = MediaQuery.of(context).size.width >= 900;

// Uso
if (isMobile) {
  // Layout móvil
} else if (isTablet) {
  // Layout tablet
} else {
  // Layout desktop
}
```

## 🌓 Dark Mode

Los componentes soportan dark mode automáticamente. Los colores se adaptan según `MediaQuery.of(context).platformBrightness`:

```dart
// Colores automáticos
AppColors.textPrimary       // Negro en claro, blanco en oscuro
AppColors.cardBackground    // Blanco en claro, gris oscuro en oscuro
AppColors.divider           // Gris claro en claro, gris oscuro en oscuro

// El tema se aplica automáticamente en main.dart
ThemeData theme = isDarkMode 
  ? AppThemeConfig.getDarkTheme()
  : AppThemeConfig.getLightTheme();
```

## ✅ Checklist de Uso

- [ ] Importar desde `/config/` para constantes de diseño
- [ ] Usar `AppDimensions` para espaciado consistente
- [ ] Usar `AppTextStyles` para tipografía consistente
- [ ] Usar `AppColors` para colores dinámicos
- [ ] Preferir componentes `Premium*` sobre widgets básicos
- [ ] Usar `FadeInAnimation`/`ScaleInAnimation` para entradas
- [ ] Usar `PremiumShimmer*` para estados de carga
- [ ] Usar `EmptyState*` widgets para estados vacíos
- [ ] Usar `PremiumDialog` para diálogos
- [ ] Probar en dark mode con `themeMode: ThemeMode.dark`

## 🎯 Mejores Prácticas

1. **Siempre centralizar colores** → Usar `AppColors.dart`
2. **Nunca hardcodear espaciado** → Usar `AppDimensions`
3. **Consistencia tipográfica** → Usar `AppTextStyles`
4. **Animaciones suave** → Usar componentes de `premium_animations`
5. **Componentes reutilizables** → Preferir `Premium*` widgets
6. **Responsive first** → Probar en móvil, tablet, desktop
7. **Dark mode support** → Colores deben adaptarse automáticamente
8. **Loading states** → Siempre mostrar `PremiumShimmer` o `PremiumLoader`
9. **Empty states** → Usar `EmptyState*` widgets apropiados
10. **Dialogs premium** → Usar `PremiumDialog` en lugar de AlertDialog nativo

## 📚 Más Información

Ver `REDESIGN_DOCUMENTATION.md` para documentación completa con ejemplos de uso en cada pantalla y componente.

---

**Made with ❤️ for Rapidito App Redesign**
