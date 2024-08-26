import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/submit_button.dart';
import 'package:netflixclone/widget/textformfield_widget.dart';
import 'package:netflixclone/widget/two_text_last_clickabel.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
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
      Navigator.pushNamed(context, "/BottomBar");
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
                child: Text("Sing Up", style: AppTextStyles.largeTitleStyle),
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
                title: "Sing Up",
                onTap: _submitForm,
              ),
              const SizedBox(height: 50),
              TwoTextLastClickabel(
                text1: "Already have an account on Netflix?\n",
                text1Color: AppColors.grayText,
                text2: "Sign in now.",
                text2Color: AppColors.white,
                onTap: () {
                  Navigator.pushNamed(context, "/SingIn");
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
                    const SnackBar(content: Text('Click')),
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
