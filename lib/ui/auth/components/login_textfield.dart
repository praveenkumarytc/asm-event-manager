import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';

enum LoginTextFieldType {
  username,
  password
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.mobileController,
    this.hintText = '',
    required this.textFieldType,
    required this.authProvider,
  });
  final String hintText;
  final LoginTextFieldType textFieldType;

  final TextEditingController mobileController;
  final AuthProvider authProvider;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 50,
      controller: mobileController,
      keyboardType: TextInputType.emailAddress,
      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
      style: subHeadingBoldWhite,
      obscureText: textFieldType == LoginTextFieldType.password ? !authProvider.passwordVisible : false,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: lightGreyText.copyWith(color: Colors.white),

        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        isDense: true, // Added this
        // contentPadding: EdgeInsets.all(8),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),

        suffixIcon: textFieldType == LoginTextFieldType.password
            ? IconButton(
                onPressed: () {
                  authProvider.changePasswordVisbility();
                },
                icon: Icon(
                  authProvider.passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
