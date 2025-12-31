import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidito_user/config/app_colors.dart';

/// Configuración de estilos para Google Maps minimalista con tema iOS
class MapStyleConfig {
  /// Estilo minimalista para tema claro
  static const String lightMapStyle = '''[
    {
      "elementType": "geometry",
      "stylers": [
        {"color": "#f5f5f5"}
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {"visibility": "off"}
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#616161"}
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {"color": "#f5f5f5"}
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#bdbdbd"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {"color": "#eeeeee"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#757575"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {"color": "#e5e5e5"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9e9e9e"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {"color": "#ffffff"}
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#757575"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {"color": "#dadada"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#616161"}
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9e9e9e"}
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "geometry",
      "stylers": [
        {"color": "#e5e5e5"}
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "geometry",
      "stylers": [
        {"color": "#eeeeee"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {"color": "#c9c9c9"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9e9e9e"}
      ]
    }
  ]''';

  /// Estilo minimalista para tema oscuro
  static const String darkMapStyle = '''[
    {
      "elementType": "geometry",
      "stylers": [
        {"color": "#242f3e"}
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {"visibility": "off"}
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#746855"}
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {"color": "#242f3e"}
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#d59563"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#d59563"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {"color": "#263c3f"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#6f9ba5"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {"color": "#38414e"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [
        {"color": "#212a37"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9ca5b3"}
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
        {"color": "#38414e"}
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9ca5b3"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {"color": "#4e6159"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
        {"color": "#27412b"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#f3d1a2"}
      ]
    },
    {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [
        {"color": "#2f3948"}
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#d59563"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {"color": "#17263c"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#515c6d"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.stroke",
      "stylers": [
        {"color": "#17263c"}
      ]
    }
  ]''';

  /// Crea un Polyline con gradiente (para rutas)
  static Polyline createGradientPolyline({
    required String polylineId,
    required List<LatLng> points,
    required Color color,
    double width = 6,
    List<Color>? gradientColors,
  }) {
    return Polyline(
      polylineId: PolylineId(polylineId),
      points: points,
      color: color,
      width: width.toInt(),
      geodesic: true,
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
    );
  }

  /// Crea un Polyline con animación de gradiente aguamarina
  static Polyline createPrimaryGradientPolyline({
    required String polylineId,
    required List<LatLng> points,
    double width = 6,
  }) {
    return createGradientPolyline(
      polylineId: polylineId,
      points: points,
      color: AppColors.primary,
      width: width,
      gradientColors: [
        AppColors.primary.withOpacity(0.3),
        AppColors.primary,
        AppColors.primary.withOpacity(0.3),
      ],
    );
  }

  /// Crea un marcador personalizado
  static BitmapDescriptor createCustomMarker({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    double size = 100,
  }) {
    return BitmapDescriptor.defaultMarkerWithHue(
      _getHueFromColor(backgroundColor),
    );
  }

  /// Convierte un color a hue para BitmapDescriptor
  static double _getHueFromColor(Color color) {
    // Retorna un hue entre 0-360
    final hslColor = HSLColor.fromColor(color);
    return hslColor.hue;
  }
}
