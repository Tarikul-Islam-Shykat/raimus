import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxSet<Marker> markers = <Marker>{}.obs;
  RxDouble latitude = 23.8103.obs;
  RxDouble longitude = 90.4125.obs;
  RxInt markerCount = 0.obs;
  RxString searchQuery = ''.obs;
  RxBool isMapView = true.obs;
  RxInt totalItems = 400.obs;
  RxInt shownItems = 230.obs;
  RxBool isSearching = false.obs;

  // Sample price data for markers
  List<int> prices = [500, 500, 500, 500, 500, 500, 500, 500];
  List<Color> markerColors = [
    Color(0xFF289D72),
    Color(0xFF289D72),
    Colors.yellow,
    Color(0xFF289D72),
    Color(0xFF289D72),
    Color(0xFF289D72),
    Color(0xFF289D72),
    Colors.yellow,
  ];

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController.value = controller;
    await getCurrentLocation();
    loadMarkers();
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      if (mapController.value != null) {
        mapController.value!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(latitude.value, longitude.value),
              zoom: 10.0,
            ),
          ),
        );
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void loadMarkers() async {
    // Sample marker positions
    List<LatLng> positions = [
      LatLng(latitude.value - 0.05, longitude.value - 0.05),
      LatLng(latitude.value + 0.1, longitude.value - 0.1),
      LatLng(latitude.value + 0.15, longitude.value + 0.15),
      LatLng(latitude.value - 0.1, longitude.value + 0.05),
      LatLng(latitude.value - 0.15, longitude.value - 0.15),
      LatLng(latitude.value + 0.05, longitude.value + 0.1),
      LatLng(latitude.value - 0.2, longitude.value),
      LatLng(latitude.value - 0.15, longitude.value + 0.15),
    ];

    for (int i = 0; i < positions.length; i++) {
      await addCustomMarker(
        positions[i],
        prices[i],
        markerColors[i],
        'marker_$i',
      );
    }
  }

  Future<void> addCustomMarker(
    LatLng position,
    int price,
    Color color,
    String markerId,
  ) async {
    final markerIcon = await _createCustomMarkerBitmap(price, color);

    final marker = Marker(
      markerId: MarkerId(markerId),
      position: position,
      icon: markerIcon,
      onTap: () {
        Get.snackbar(
          'Marker Tapped',
          'Price: \$$price',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );

    markers.add(marker);
    markerCount.value = markers.length;
  }

  Future<BitmapDescriptor> _createCustomMarkerBitmap(
    int price,
    Color fillColor,
  ) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint fillPaint = Paint()..color = fillColor;

    const double padding = 8; // White padding around the marker
    const double markerWidth = 120;
    const double markerHeight = 80;
    const double triangleHeight = 20;
    const double borderRadius = 20;

    // Total canvas size including padding
    const double totalWidth = markerWidth + (padding * 2);
    const double totalHeight = markerHeight + (padding * 2);

    final double bodyHeight = markerHeight - triangleHeight;

    // Canvas remains transparent (no background fill)

    // Draw rounded rectangle body (offset by padding)
    final RRect body = RRect.fromRectAndRadius(
      Rect.fromLTWH(padding, padding, markerWidth, bodyHeight),
      Radius.circular(borderRadius),
    );
    canvas.drawRRect(body, fillPaint);

    // Draw downward triangle (offset by padding)
    final Path trianglePath = Path()
      ..moveTo(padding + markerWidth / 2 - 20, padding + bodyHeight)
      ..lineTo(padding + markerWidth / 2, padding + markerHeight)
      ..lineTo(padding + markerWidth / 2 + 20, padding + bodyHeight)
      ..close();
    canvas.drawPath(trianglePath, fillPaint);

    // Draw centered text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${price}k',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout(minWidth: markerWidth, maxWidth: markerWidth);
    textPainter.paint(canvas,
        Offset(padding, padding + (bodyHeight - textPainter.height) / 2));

    // Convert to image with total dimensions including padding
    final image = await pictureRecorder.endRecording().toImage(
          totalWidth.toInt(),
          totalHeight.toInt(),
        );
    final byteData = await image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  void toggleView() {
    isMapView.value = !isMapView.value;
  }

  void searchLocation(String query) async {
    if (query.isEmpty) return;

    isSearching.value = true;
    searchQuery.value = query;

    try {
      List<Location> locations = await locationFromAddress(query);

      if (locations.isNotEmpty) {
        latitude.value = locations.first.latitude;
        longitude.value = locations.first.longitude;

        if (mapController.value != null) {
          mapController.value!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(latitude.value, longitude.value),
                zoom: 12.0,
              ),
            ),
          );
        }
      }
    } catch (e) {
      print("Error searching location: $e");
      Get.snackbar(
        'Search Error',
        'Could not find the location',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isSearching.value = false;
    }
  }
}
