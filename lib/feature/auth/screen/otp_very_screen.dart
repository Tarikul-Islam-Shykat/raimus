import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/feature/auth/controller/otp_v_controller.dart';
import 'package:prettyrini/feature/auth/widget/custom_booton_widget.dart';
import 'package:prettyrini/route/route.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/image_path.dart';

class OtpVeryScreen extends StatelessWidget {
  const OtpVeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpController otpController = Get.put(OtpController());
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

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
                headingText(text: "Apply Code Here"),
                SizedBox(height: 10),
                normalTextG(
                    "Please check your email. Give correct authentication code here. "),
                SizedBox(height: 20),

                // OTP Input Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => _buildOtpTextField(index, otpController),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(height: 20),

                // Auth Icon
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.15,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        color: AppColors.btnColor,
                        onTap: () {
                          Get.toNamed(AppRoute.resetPassScreen);
                        },
                        title: Text(
                          "Apply Code",
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

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        color: AppColors.btnSubtleColor,
                        onTap: () {},
                        title: Text(
                          "Send Email Again",
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  // Obx(() => CustomButton(
                  //       color: otpController.isOtpComplete.value
                  //           ? AppColors.btnColor
                  //           : AppColors.btnColor.withOpacity(0.6),
                  //       onTap: () => otpController.verifyOtp(),
                  //       title: Text(
                  //         "Verify OTP",
                  //         style: GoogleFonts.inter(
                  //           color: Colors.white,
                  //           fontSize: 18.sp,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     )),
                  // SizedBox(height: 10),
                  // CustomButton(
                  //   color: Colors.transparent,
                  //   onTap: () => Get.back(),
                  //   title: Text(
                  //     "Back",
                  //     style: GoogleFonts.inter(
                  //       color: Colors.white,
                  //       fontSize: 16.sp,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpTextField(int index, OtpController controller) {
    return Container(
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller.controllers[index],
        focusNode: controller.focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => controller.onOtpChanged(value, index),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/feature/auth/widget/custom_booton_widget.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/image_path.dart';

class OtpVeryScreen extends StatelessWidget {
  const OtpVeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

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
                headingText(text: "Apply Code Here"),
                SizedBox(
                  height: 10,
                ),
                normalTextG(
                    "Please check your email. Give correct authentication code here. "),
                SizedBox(
                  height: 20,
                ),
                // here will be the otp
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
                    onTap: () {},
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

*/
