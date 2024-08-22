import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/submit_button.dart';
import 'package:netflixclone/widget/textformfield_widget.dart';
import 'package:netflixclone/widget/two_text_last_clickabel.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  // Create a GlobalKey to manage the Form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Create a TextEditingController
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Create a FocusNode
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // Define a validator function
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Simple email validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password can not be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    } else {
      _emailFocusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 110),
              Image.asset("assets/netflix/netflixname.png"),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.center,
                child: Text("Sing In", style: AppTextStyles.largeTitle),
              ),
              const SizedBox(height: 40),
              TextFormFieldWidget(
                labelText: "Email Address",
                keyboardType: TextInputType.text,
                textController: _emailController,
                validator: _validateEmail,
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                labelText: "Password",
                keyboardType: TextInputType.text,
                textController: _passwordController,
                validator: _validatePassword,
              ),
              const SizedBox(height: 30),
              SubmitButton(
                title: "Sing In",
                onTap: _submitForm,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.center,
                child: InkWell(
                    child: Text("Forgot password?",
                        style: AppTextStyles.largeText)),
              ),
              const SizedBox(height: 20),
              TwoTextLastClickabel(
                text1: "New to Netflix?",
                text1Color: AppColors.grayText,
                text2: " Sign up now.",
                text2Color: AppColors.white,
                onTap: () {
                  Navigator.pushNamed(context, "/SingUp");
                },
              ),
              const SizedBox(height: 40),
              TwoTextLastClickabel(
                text1:
                    "This page is protected by Google reCAPTCHA to ensure you're not a bot.",
                text1Color: AppColors.grayText,
                text2: " Learn more.",
                text2Color: AppColors.deepPurpleText,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Click')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
