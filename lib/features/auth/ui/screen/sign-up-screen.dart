import 'package:e_commerce/features/auth/data/models/sign_up_params.dart';
import 'package:e_commerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:e_commerce/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:e_commerce/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogoWidget(width: 100, height: 100),
              const SizedBox(height: 24),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Get started us with your details',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildForm(),
              GetBuilder<SignUpController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress==false,
                    replacement: CircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  );
                }
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your email address';
              }
              if (EmailValidator.validate(value!) == false) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your First Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: const InputDecoration(hintText: 'Last Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your Last Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            controller: _mobileTEController,
            maxLength: 11,
            decoration: const InputDecoration(hintText: 'Mobile'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your Mobile Number';
              }
              if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false) {
                return 'Enter valid Mobile Number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityTEController,
            decoration: const InputDecoration(hintText: 'City'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid City';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            decoration: const InputDecoration(hintText: 'Password'),
            validator: (String? value) {
              if ((value?.isEmpty ?? true) || value!.length < 6) {
                return 'Enter a password more than 8 letters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      password: _passwordTEController.text,
      email: _emailTEController.text.trim(),
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      city: _cityTEController.text.trim(),
      mobile: _mobileTEController.text.trim(),
    );
    final bool isSuccess = await _signUpController.signUp(params);

    if (isSuccess) {
      Navigator.pushNamed(context, OtpVerificationScreen.name,arguments: _emailTEController.text.trim());
    } else {
      showSnackBarMessage(context, _signUpController.errorMessage!);
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose;
    _lastNameTEController.dispose;
    _mobileTEController.dispose;
    _cityTEController.dispose();
    _emailTEController.dispose;
    _passwordTEController.dispose;

    super.dispose();
  }
}
