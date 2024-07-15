import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupTextfield extends StatelessWidget {
  const SignupTextfield({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.onSubmit,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
  });

  final FocusNode? focusNode;

  final bool obscureText;

  final TextEditingController controller;
  final String? labelText, hintText;
  final void Function(String value)? onSubmit;
  final Widget? suffixIcon;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      style: subHeadingBoldWhite,
      cursorColor: Colors.white,
      maxLength: maxLength,
      onSubmitted: onSubmit,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        label: labelText != null
            ? Text(
                labelText!,
                style: priceText.copyWith(color: Colors.white),
              )
            : null,
        hintText: hintText,
        hintStyle: lightGreyTextLarge.copyWith(color: Colors.white),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
