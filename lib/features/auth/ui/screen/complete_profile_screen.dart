import 'package:e_commerce/features/common/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text('Next'),
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
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First Name'),
            validator: (String? value){
              if(value?.trim().isEmpty??true){
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
            validator: (String? value){
              if(value?.trim().isEmpty??true){
                return 'Enter your Last Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            controller: _mobileTEController,
            maxLength: 11,
            decoration: const InputDecoration(hintText: 'Mobile'),
            validator: (String? value){
              if(value?.trim().isEmpty??true){
                return 'Enter your Mobile Number';
              }
              if(RegExp(r'^01[3-9]\d{8}$').hasMatch(value!)==false){
                return 'Enter valid Mobile Number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityTEController,
            decoration: const InputDecoration(hintText: 'City'),
            validator: (String? value){
              if(value?.trim().isEmpty??true){
                return 'Enter valid City';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _shippingAddressTEController,
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Shipping Address'),
            validator: (String? value){
              if(value?.trim().isEmpty??true){
                return 'Enter valid shipping address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose;
    _lastNameTEController.dispose;
    _mobileTEController.dispose;
    _cityTEController.dispose();
    _shippingAddressTEController.dispose;
    super.dispose();
  }
}
