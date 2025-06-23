import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/app_snackbar.dart';
import 'package:prettyrini/core/const/widget.dart';
import 'package:prettyrini/core/controller/theme_controller.dart';
import 'package:prettyrini/core/global_widegts/app_text_widget.dart';
import 'package:prettyrini/core/global_widegts/coustom_dialouge.dart';
import 'package:prettyrini/core/local/local_service.dart';
import 'package:prettyrini/feature/auth/widget/custom_booton_widget.dart';
import 'package:prettyrini/feature/auth/widget/text_field_widget.dart';
import 'package:prettyrini/route/route.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/const/image_path.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var loginEmailController = TextEditingController();
    var loginPasswordController = TextEditingController();
    var loginNameController = TextEditingController();

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
                headingText(text: "Create An Account"),
                SizedBox(
                  height: 10,
                ),
                normalTextG(
                    "Start your journey to mastering money with fun,interactive lessons today!"),
                SizedBox(height: 20.h),
                CustomAuthField(
                  controller: loginEmailController,
                  hintText: "Enter Full Name",
                ),
                SizedBox(height: 10.h),
                CustomAuthField(
                  controller: loginPasswordController,
                  hintText: "Enter Email",
                  // suffixIcon: Image.asset(ImagePath.passwordHidden),
                ),
                SizedBox(height: 10.h),
                CustomAuthField(
                  controller: loginPasswordController,
                  hintText: "Password",
                  // suffixIcon: Image.asset(ImagePath.passwordHidden),
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
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "By Continue, You Agree to the Boundeless Inc",
                        style: GoogleFonts.inter(
                            color: Colors.grey, fontSize: 12.sp),
                        children: [
                          TextSpan(
                            text: " \nTerms & Condition ",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: " & ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          TextSpan(
                            text: " Privacy Policy",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: ".",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    color: AppColors.btnColor,
                    onTap: () {},
                    title: Text(
                      "Sign Up",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.loginScreen);
                        },
                        child: Text(
                          'Log In',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
