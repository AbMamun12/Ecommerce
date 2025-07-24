import 'package:e_commerce/app/app_theme_data.dart';
import 'package:e_commerce/app/controller_binder.dart';
import 'package:e_commerce/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/screen/splash_screen.dart';
import 'package:e_commerce/features/category/ui/screens/category_list_screen.dart';
import 'package:e_commerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../features/auth/ui/screen/complete_profile_screen.dart';
import '../features/auth/ui/screen/email_verification_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name: (context) => const CompleteProfileScreen(),
        MainBottomNavScreen.name: (context) => const MainBottomNavScreen(),
        CategoryListScreen.name: (context) => const CategoryListScreen(),

      },
    );
  }
}
