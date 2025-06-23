import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), // Your ImagePath.bg
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              devToSpace(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.35),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: Color(0xFF6C757D),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),

                    // Centered title
                    Expanded(
                      child: Center(
                        child: Text(
                          'Apartment Details',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.35),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        icon: const Icon(
                          Icons.favorite,
                          size: 18,
                          color: Color(0xFF6C757D),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/state.png',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Gradient overlay for better text readability
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                      // Text overlay
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Colony, New\nMexico 90210',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Millsboro-DE',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey.shade800),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '4.8',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPropertyFeature('03', 'Beds'),
                    _buildDivider(),
                    _buildPropertyFeature('02', 'Bath'),
                    _buildDivider(),
                    _buildPropertyFeature('1290', 'Sqft'),
                  ],
                ),
              ),

              // Description
              _buildSectionTitle('Description'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Listing Agent / Broker
              _buildSectionTitle('Listing Agent / Broker'),
              _buildInfoRow(
                icon: Icons.person_outline,
                title: 'Lewis Alexander',
                showArrow: true,
              ),
              _buildInfoRow(
                icon: Icons.business_outlined,
                title: 'eXp Realty, LLC',
                showArrow: true,
              ),
              const SizedBox(height: 16),

              // Property Information
              _buildSectionTitle('Property Information'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.35),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    _buildPropertyInfoRow('Price per SQFT', '\$210.06'),
                    _buildPropertyInfoRow(
                      'Property Type',
                      'Residential - Single Family',
                    ),
                    _buildPropertyInfoRow('Status', 'Active'),
                    _buildPropertyInfoRow('Bedrooms', '4'),
                    _buildPropertyInfoRow('Baths', '3 Full and 1 Half'),
                    _buildPropertyInfoRow('County', 'Denton'),
                    _buildPropertyInfoRow(
                      'Subdivision',
                      'Wellington Estates Ph 3',
                    ),
                    _buildPropertyInfoRow(
                      'Description',
                      'MN ID #13447 WELLINGTON ESTATES PH 3 BLK V LOT 4',
                    ),
                  ],
                ),
              ),

              // Add some space at the bottom
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper methods

  Widget _buildPropertyFeature(String value, String label) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.35),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 40, width: 1, color: Colors.grey[300]);
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    bool showArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            radius: 20,
            child: Icon(icon, color: Colors.black, size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
          if (showArrow)
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPropertyInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

// To use this screen, you can navigate to it from your property card tap
// Example usage:
/*
void navigateToDetails(Property property) {
  Get.to(() => const PropertyDetailsScreen());
}
*/
