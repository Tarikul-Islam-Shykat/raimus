import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/widget.dart';
import 'package:prettyrini/core/controller/theme_controller.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/feature/auth/widget/custom_booton_widget.dart';
import 'package:prettyrini/feature/auth/widget/text_field_widget.dart';
import 'package:prettyrini/route/route.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/const/image_path.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var loginEmailController = TextEditingController();
    var loginPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Image.asset(
              ImagePath.bg,
              fit: BoxFit.fill,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                devToSpace(),
                headingText(text: "Reset Password Here"),
                SizedBox(
                  height: 10,
                ),
                normalTextG("Reset your account password here"),
                SizedBox(height: 20.h),
                CustomAuthField(
                  controller: loginEmailController,
                  hintText: "New Password",
                ),
                SizedBox(height: 10.h),
                CustomAuthField(
                  controller: loginEmailController,
                  hintText: "Confirm Password",
                  // suffixIcon: Image.asset(ImagePath.passwordHidden),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),

          // Bottom buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    color: AppColors.btnColor,
                    onTap: () {
                      Get.toNamed(AppRoute.loginScreen);
                    },
                    title: Text(
                      "Reset Password",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
