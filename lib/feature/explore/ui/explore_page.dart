import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/route/route.dart';

// Example of how to replace placeholder icons with your assets
class ExploreScreenWithAssets extends StatelessWidget {
  const ExploreScreenWithAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
            Center(
              child: Text(
                'Explore',
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.8, // Adjust height if needed

              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 1.1,
                children: [
                  _buildExploreCardWithAsset('All Property', ImagePath.ic1),
                  _buildExploreCardWithAsset('Mortgage', ImagePath.ic2),
                  _buildExploreCardWithAsset('Find Agent', ImagePath.ic3),
                  _buildExploreCardWithAsset('Find Broker', ImagePath.ic4),
                  _buildExploreCardWithAsset('Schools', ImagePath.ic5),
                  _buildExploreCardWithAsset('Places', ImagePath.ic6),
                  _buildExploreCardWithAsset('Parks', ImagePath.ic7),
                  _buildExploreCardWithAsset('Librarys', ImagePath.ic8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreCardWithAsset(String title, String assetPath) {
    return GestureDetector(
      onTap: () {
        if (title == "All Property") {
          Get.toNamed(AppRoute.allPropertyScreen);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.35),
          borderRadius: BorderRadius.circular(16.r),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.08),
          //     blurRadius: 10,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your asset icon
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  assetPath,
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
