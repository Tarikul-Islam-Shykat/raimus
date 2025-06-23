import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtpController extends GetxController {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  
  RxString otpCode = ''.obs;
  RxBool isOtpComplete = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Add listeners to all controllers
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].addListener(() => updateOtpCode());
    }
  }

  void updateOtpCode() {
    String code = '';
    for (var controller in controllers) {
      code += controller.text;
    }
    otpCode.value = code;
    isOtpComplete.value = code.length == 4;
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      // Move to next field
      FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      // Move to previous field when backspace is pressed
      FocusScope.of(Get.context!).requestFocus(focusNodes[index - 1]);
    }
    updateOtpCode();
  }

  void clearOtp() {
    for (var controller in controllers) {
      controller.clear();
    }
    otpCode.value = '';
    isOtpComplete.value = false;
    FocusScope.of(Get.context!).requestFocus(focusNodes[0]);
  }

  void verifyOtp() {
    if (isOtpComplete.value) {
      // Handle OTP verification here
      print('OTP Code: ${otpCode.value}');
      // Add your verification logic
      Get.snackbar(
        'Success',
        'OTP verified successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please enter complete OTP code',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resendOtp() {
    // Handle resend OTP logic here
    clearOtp();
    Get.snackbar(
      'Info',
      'OTP resent successfully!',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }
}