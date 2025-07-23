import 'package:e_commerce/app/app_theme_data.dart';
import 'package:e_commerce/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screen/email_verification_screen.dart';
import 'app_colors.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
      },
    );
  }
}
