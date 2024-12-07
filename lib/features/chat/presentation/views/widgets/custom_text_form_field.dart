import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/styless.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintTxt;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffix;

  const CustomTextFormField({
    super.key,
    required this.hintTxt,
    this.controller,
    this.validator,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: Styless.textSimeBold14,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: AppColors.info,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16, // Reduced padding for better alignment
        ),
        hintText: hintTxt,
        hintStyle: Styless.textRegular14,
        suffixIcon: suffix != null
            ? Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: suffix,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.mainColor,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
