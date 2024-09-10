import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/submit_button.dart';
import 'package:netflixclone/widget/success_message.dart';
import 'package:netflixclone/widget/textformfield_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Create a GlobalKey to manage the Form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Create TextEditingControllers
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Define validators
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle change password action here
      SuccessMessage(context: context, message: "Your password has been changed successfully!").show();
      Navigator.pushReplacementNamed(context, "/SingIn");
    }
  }

  // void _showSuccessSnackBar() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: const Text(
  //         'Your password has been changed successfully!',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       backgroundColor: Colors.green, // Green background
  //       behavior: SnackBarBehavior.floating,
  //       margin: const EdgeInsets.all(16.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
              Image.asset("assets/reset-password.png",width: wSize*0.3,height: wSize*0.3,),
              const SizedBox(height: 40),
              const Text(
                "Change Password",
                style: AppTextStyles.largeTitleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormFieldWidget(
                labelText: "Current Password",
                textController: _currentPasswordController,
                validator: _validatePassword,
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                labelText: "New Password",
                textController: _newPasswordController,
                validator: _validatePassword,
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                labelText: "Confirm New Password",
                textController: _confirmPasswordController,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 30),
              SubmitButton(
                title: "Change Password",
                onTap: _submitForm,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
