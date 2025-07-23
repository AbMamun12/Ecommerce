import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/common/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _OtpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 24),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 4 Digit OTP has been sent to your email',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: AppColors.themeColor,
                    inactiveColor: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: _OtpTEController,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    //if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),
                //TODO: enable button when 120s is done and invisible the text
                //stream, timer()setstate, getx(obs)
                RichText(
                  text: TextSpan(
                    text: 'This code will be expire in ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: '120s',
                        style: TextStyle(color: AppColors.themeColor),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Resend Code')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
