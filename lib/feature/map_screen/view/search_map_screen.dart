import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prettyrini/feature/home/controller/home_controller.dart';
import 'package:prettyrini/feature/home/model/property_model.dart';

import 'package:prettyrini/feature/map_screen/controller/search_map_controller.dart';
import 'package:prettyrini/route/route.dart';

class MapScreen extends StatelessWidget {
  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map View or List View
          Obx(
            () => mapController.isMapView.value
                ? _buildMapView()
                : _buildListView(),
          ),

          // Top Panel
          Positioned(top: 40, left: 20, right: 20, child: _buildTopPanel()),

          // Draw button
          Positioned(bottom: 40, left: 20, child: _buildDrawButton()),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return Obx(
      () => GoogleMap(
        onMapCreated: mapController.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            mapController.latitude.value,
            mapController.longitude.value,
          ),
          zoom: 10.0,
        ),
        markers: mapController.markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
      ),
    );
  }

  Widget _buildListView() {
    final PropertyController propertyController = Get.put(PropertyController());

    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Expanded(
          child: Obx(
            () => propertyController.filteredProperties.isEmpty
                ? const Center(child: Text('No properties found'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: propertyController.filteredProperties.length,
                    itemBuilder: (context, index) {
                      final property =
                          propertyController.filteredProperties[index];
                      return _buildPropertyCard(context, property);
                    },
                  ),
          ),
        ),
      ],
    );
  }

  // Property card widget
  Widget _buildPropertyCard(BuildContext context, Property property) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail screen (not implemented)
        Get.toNamed(AppRoute.propertyDetailsScreen);
        // Get.snackbar(
        //   'Property Selected',
        //   'You selected ${property.address}',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image with overlay info
            Stack(
              children: [
                // Property image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    property.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Bed, Bath, Sqft overlay
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${property.beds} beds',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 12,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${property.baths} bath',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 12,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${property.sqft} sqft',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Property type tag
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: property.listingType == 'For Sale'
                          ? Colors.green
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      property.listingType,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 40.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      icon: const Icon(
                        Icons.arrow_outward,
                        size: 18,
                        color: Colors.black,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),

            // Property details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          property.address,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '\$${property.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property.location,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter bottom sheet

  Widget _buildTopPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search bar
        Row(
          children: [
            // Search Box
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onSubmitted: (value) {
                          mapController.searchLocation(value);
                        },
                      ),
                    ),
                    Obx(
                      () => mapController.isSearching.value
                          ? Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.green,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(width: 12),
                    ),
                  ],
                ),
              ),
            ),

            // Spacing between search box and tune icon
            SizedBox(width: 8.0),

            // Tune Icon
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF289D72),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: Icon(Icons.tune, color: Colors.white),
                onPressed: () {
                  // Show filters
                },
              ),
            ),
          ],
        ),

        // View toggle and counter
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Main container background
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(color: Colors.green),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Map Button Container
                      GestureDetector(
                        onTap: () {
                          mapController.isMapView.value = true;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: mapController.isMapView.value
                                ? Color(0xFF289D72)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6.0,
                          ),
                          child: Text(
                            'Map',
                            style: TextStyle(
                              color: mapController.isMapView.value
                                  ? Colors.white
                                  : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      // List Button Container
                      GestureDetector(
                        onTap: () {
                          mapController.isMapView.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: !mapController.isMapView.value
                                ? Color(0xFF289D72)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6.0,
                          ),
                          child: Text(
                            'List',
                            style: TextStyle(
                              color: !mapController.isMapView.value
                                  ? Colors.white
                                  : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Counter
              Obx(
                () => Row(
                  children: [
                    Text(
                      '${mapController.shownItems.value} out of ${mapController.totalItems.value}',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Sort',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDrawButton() {
    return Container(
      width: 60,
      height: 90, // increased height to fit text
      decoration: BoxDecoration(
        color: Color(0xFF289D72),
        shape: BoxShape.circle, // Still circular
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.create, color: Colors.white, size: 20),
          Text(
            'Draw',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
