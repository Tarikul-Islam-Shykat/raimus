import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/feature/auth/widget/custom_booton_widget.dart';
import 'package:prettyrini/feature/auth/widget/text_field_widget.dart';
import 'package:prettyrini/route/route.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/image_path.dart';

class ForgetPaswordScreen extends StatelessWidget {
  const ForgetPaswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                devToSpace(),
                headingText(text: "Forget Password"),
                SizedBox(
                  height: 10,
                ),
                normalTextG(
                    "Start your journey to mastering money with fun,interactive lessons today! "),
                SizedBox(
                  height: 20,
                ),
                CustomAuthField(
                  controller: emailController,
                  hintText: "Phone Number/Email",
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  child: Image.asset(
                    ImagePath.authIcon,
                    fit: BoxFit.contain,
                  ),
                ),
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
                      Get.toNamed(AppRoute.otpVerifyScreen);
                    },
                    title: Text(
                      "Send Email",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18.sp,
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
