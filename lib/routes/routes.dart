import 'package:ai_space/view/auth/email_requested_screen.dart';
import 'package:ai_space/view/auth/login_screen.dart';
import 'package:ai_space/view/auth/verification_screen.dart';
import 'package:ai_space/view/home/landing_screen.dart';
import 'package:get/get.dart';

class RouteClass {
  static String landingScreen = "/";
  static String signUp = "/signUp";
  static String emailVerificationScreen = "/emailVerificationScreen";
  static String emailRequestScreen = "/emailRequestScreen";

  static String getHomeRoute() => landingScreen;
  static String getSignUpRoute() => signUp;
  static String getEmailVerificationScreen() => emailVerificationScreen;
  static String getEmailRequestScreen() => emailRequestScreen;

  static List<GetPage> routes = [
    GetPage(name: landingScreen, page: () => const LandingScreen()),
    GetPage(name: signUp, page: () => const LoginScreen()),
    GetPage(
        name: emailVerificationScreen,
        page: () => const EmailVerificationScreen()),
    GetPage(name: emailRequestScreen, page: () => const EmailRequestedScreen())
  ];
}
