import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  const TextFormFieldWidget({super.key,required this.labelText,this.keyboardType,required this.textController, this.validator});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return TextFormField(
      cursorHeight: 18,
      focusNode: focusNode,
      controller: textController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          // filled: true,
          // fillColor: Colors.transparent,
          hoverColor: Colors.white,
          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          contentPadding: const EdgeInsets.fromLTRB(14.0, 2, 14.0, 2),
          labelText: labelText,labelStyle: const TextStyle(color: AppColors.white,fontSize: 12,fontWeight: FontWeight.w400,letterSpacing: 1.2),
          enabledBorder:
          OutlineInputBorder(borderSide: const BorderSide(color: AppColors.white),borderRadius: BorderRadius.circular(6)),
          focusedBorder:
          OutlineInputBorder(borderSide: const BorderSide(color: AppColors.white),borderRadius: BorderRadius.circular(6)),
          errorBorder:
          OutlineInputBorder(borderSide: const BorderSide(color: AppColors.errorColor),borderRadius: BorderRadius.circular(6)),
          errorStyle: const TextStyle(
              fontSize: 12,
              height: 1,
              fontFamily: "primary-font-family",
              fontWeight: FontWeight.w600,
              color: AppColors.errorColor),
      ),
      validator: validator,
    );
  }
}
