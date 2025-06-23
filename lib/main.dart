import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/controller/theme_controller.dart';
import 'package:prettyrini/feature/broker_home/ui/broker_home.dart';
import 'package:prettyrini/feature/broker_list/ui/broker_page.dart';
import 'package:prettyrini/feature/home/view/home_screen.dart';
import 'package:prettyrini/feature/map_screen/view/search_map_screen.dart';
import 'package:prettyrini/feature/profile/ui/profile_page.dart';
import 'package:prettyrini/feature/property_details/ui/property_details.dart';
import 'package:prettyrini/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/const/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configEasyLoading();
  await SharedPreferences.getInstance();
  Get.put(ThemeController());
  runApp(const MyApp());
}

void configEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.grayColor
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..maskColor = Colors.green
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foot Fitness',
        getPages: AppRoute.routes,
        initialRoute: AppRoute.splashScreen,
        builder: EasyLoading.init(),
        //  home: SignUpScreen(),
        // home: LoginScreen()
        // home: ResetPassword(),
        //   home: OtpVeryScreen(),
        //   home: ForgetPaswordScreen(),
        //home: ExploreScreenWithAssets(),
        //home: MessageScreen(),
        //    home: AllPropertyScreen(),
        //  home: BrokerPageScreen(),
        //home: ProfileScreen(),
        //  home: HomeScreen(),
        //   home: PropertyDetailsScreen(),
        //  home: MapScreen(),
        //   home: BrokerHomeScreen(),
      ),
    );
  }
}
