import 'package:get/get.dart';
import 'package:prettyrini/feature/all_property/ui/all_property_page.dart';
import 'package:prettyrini/feature/auth/screen/otp_very_screen.dart';
import 'package:prettyrini/feature/auth/screen/sign_up_screen.dart';
import 'package:prettyrini/feature/broker_list/ui/broker_page.dart';
import 'package:prettyrini/feature/chat_page/ui/chat_screen.dart';
import 'package:prettyrini/feature/dashboard/ui/dashboard_ui.dart';
import 'package:prettyrini/feature/explore/ui/explore_page.dart';
import 'package:prettyrini/feature/for_sale/ui/for_sale.dart';
import 'package:prettyrini/feature/home/view/home_screen.dart';
import 'package:prettyrini/feature/map_screen/view/search_map_screen.dart';
import 'package:prettyrini/feature/profile/ui/profile_page.dart';
import 'package:prettyrini/feature/property_details/ui/property_details.dart';

// Import all your screens here
import '../feature/auth/screen/forget_pasword_screen.dart';
import '../feature/auth/screen/sign_in_screen.dart';
import '../feature/auth/screen/reset_password.dart';
// for MapScreen
import '../feature/splash_screen/screen/splash_screen.dart'; // SplashScreen

class AppRoute {
  static String splashScreen = '/splashScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signUpScreen';
  static String forgetScreen = '/forgetScreen';
  static String resetPassScreen = '/resetPassScreen';
  static String otpVerifyScreen = '/otpVerifyScreen';
  static String exploreScreen = '/exploreScreen';
  static String messageScreen = '/messageScreen';
  static String allPropertyScreen = '/allPropertyScreen';
  static String brokerPageScreen = '/brokerPageScreen';
  static String profileScreen = '/profileScreen';
  static String homeScreen = '/homeScreen';
  static String propertyDetailsScreen = '/propertyDetailsScreen';
  static String mapScreen = '/mapScreen';

  static String dashboard = '/dashBoard';
  static String forSale = '/forSale';

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignUpScreen() => signUpScreen;
  static String getForgetScreen() => forgetScreen;
  static String getResetPassScreen() => resetPassScreen;
  static String getOtpVerifyScreen() => otpVerifyScreen;
  static String getExploreScreen() => exploreScreen;
  static String getMessageScreen() => messageScreen;
  static String getAllPropertyScreen() => allPropertyScreen;
  static String getBrokerPageScreen() => brokerPageScreen;
  static String getProfileScreen() => profileScreen;
  static String getHomeScreen() => homeScreen;
  static String getPropertyDetailsScreen() => propertyDetailsScreen;
  static String getMapScreen() => mapScreen;
  static String getDashboardPage() => dashboard;
  static String getForSale() => forSale;

  static List<GetPage> routes = [
    GetPage(name: forSale, page: () => ForSalePage()),
    GetPage(name: dashboard, page: () => DashboardUi()),
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: forgetScreen, page: () => const ForgetPaswordScreen()),
    GetPage(name: resetPassScreen, page: () => ResetPassword()),
    GetPage(name: otpVerifyScreen, page: () => OtpVeryScreen()),
    GetPage(name: exploreScreen, page: () => ExploreScreenWithAssets()),
    GetPage(name: messageScreen, page: () => MessageScreen()),
    GetPage(name: allPropertyScreen, page: () => AllPropertyScreen()),
    GetPage(name: brokerPageScreen, page: () => BrokerPageScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: propertyDetailsScreen, page: () => PropertyDetailsScreen()),
    GetPage(name: mapScreen, page: () => MapScreen()),
  ];
}
