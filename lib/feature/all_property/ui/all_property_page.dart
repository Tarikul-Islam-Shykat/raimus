import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/route/route.dart';

class AllPropertyScreen extends StatelessWidget {
  const AllPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            devToSpace(),

            // Header with back button and title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(.35)),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'All Property',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 36.w), // Balance the back button
                ],
              ),
            ),

            SizedBox(height: 30.h),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildPropertyOption(
                      'For Sale',
                      ImagePath.ic1, // Replace with your sale icon
                      onTap: () {
                        Get.toNamed(AppRoute.forSale);
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOption(
                      'For Rental',
                      ImagePath.ic1, // Replace with your rental icon
                      onTap: () {
                        // Navigate to For Rental properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOption(
                      'For Lease',
                      ImagePath.ic1, // Replace with your lease icon
                      onTap: () {
                        // Navigate to For Lease properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOption(
                      'For Commercial',
                      ImagePath.ic1, // Replace with your commercial icon
                      onTap: () {
                        // Navigate to For Commercial properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOption(
                      'For Residential',
                      ImagePath.ic1, // Replace with your residential icon
                      onTap: () {
                        // Navigate to For Residential properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOption(
                      'For New Construction',
                      ImagePath.ic1, // Replace with your construction icon
                      onTap: () {
                        // Navigate to For New Construction properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOption(
                      'For Open House',
                      ImagePath.ic1, // Replace with your open house icon
                      onTap: () {
                        // Navigate to For Open House properties
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyOption(String title, String iconPath,
      {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.35),
          borderRadius: BorderRadius.circular(12.r),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.06),
          //     blurRadius: 8,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Row(
          children: [
            // Property icon
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  iconPath,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 16.w),

            // Property title
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            // Arrow icon
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative version with specific property icons
class AllPropertyScreenWithSpecificIcons extends StatelessWidget {
  const AllPropertyScreenWithSpecificIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            devToSpace(),

            // Header with back button and title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'All Property',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 36.w),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            // Property options list
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  children: [
                    _buildPropertyOptionWithSpecificIcon(
                      'For Sale',
                      'assets/icons/for_sale.png', // Your specific sale icon
                      onTap: () {
                        // Navigate to For Sale properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOptionWithSpecificIcon(
                      'For Rental',
                      'assets/icons/for_rental.png', // Your specific rental icon
                      onTap: () {
                        // Navigate to For Rental properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOptionWithSpecificIcon(
                      'For Lease',
                      'assets/icons/for_lease.png', // Your specific lease icon
                      onTap: () {
                        // Navigate to For Lease properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOptionWithSpecificIcon(
                      'For Commercial',
                      'assets/icons/for_commercial.png', // Your specific commercial icon
                      onTap: () {
                        // Navigate to For Commercial properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOptionWithSpecificIcon(
                      'For Residential',
                      'assets/icons/for_residential.png', // Your specific residential icon
                      onTap: () {
                        // Navigate to For Residential properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOptionWithSpecificIcon(
                      'For New Construction',
                      'assets/icons/for_construction.png', // Your specific construction icon
                      onTap: () {
                        // Navigate to For New Construction properties
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildPropertyOptionWithSpecificIcon(
                      'For Open House',
                      'assets/icons/for_open_house.png', // Your specific open house icon
                      onTap: () {
                        // Navigate to For Open House properties
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyOptionWithSpecificIcon(String title, String iconPath,
      {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Property icon
            Image.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 16.w),

            // Property title
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            // Arrow icon
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
