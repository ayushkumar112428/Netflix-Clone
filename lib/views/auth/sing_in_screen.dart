import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
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
      context.pushReplacement("/bottomBar");
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

  Future<bool> _onWillPop() async {
    final shouldExit = await showDialog(
      context: context,
      barrierDismissible: false, // Prevents dialog from closing on outside tap
      builder: (context) => AlertDialog(
        title: const Text('Exit App?'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pop(true),
            child: Container(
              width: 70,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.grey,
              ),
              child: const Center(child: Text('No', style: AppTextStyles.textButtonTextStyle)),
            ),
          ),
          InkWell(
            onTap: () => SystemNavigator.pop(),
            child: Container(
              width: 70,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.red,
              ),
              child: const Center(child: Text('Yes', style: AppTextStyles.textButtonTextStyle)),
            ),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackButtonListener(
        onBackButtonPressed: (){
          return _onWillPop();
        },
        child: Padding(
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
                  child: Text("Sing In", style: AppTextStyles.largeTitleStyle),
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
                          style: AppTextStyles.authScreenDetailsTextStyle)),
                ),
                const SizedBox(height: 20),
                TwoTextLastClickabel(
                  text1: "New to Netflix?",
                  text1Color: AppColors.grayText,
                  text2: " Sign up now.",
                  text2Color: AppColors.white,
                  onTap: () {
                    context.push("/singUp");
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
      ),
    );
  }
}
