import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/ui/auth/components/asm_button.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchAuthScreens extends StatelessWidget {
  const SwitchAuthScreens({super.key, this.onTap, this.isOtpPage = false});
  final Function()? onTap;
  final bool isOtpPage;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, details, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            AsmButtonButton(
              onTap: onTap,
              child: Text(
                !isOtpPage ? 'Send OTP' : 'Verify',
                style: subHeadingBoldWhite,
              ),
            ),
            /* 65.heightBox,
               OutlinedButton(
              onPressed: () {
                details.changeAuthScreenIndex();
              },
              style: const ButtonStyle(
                side: MaterialStatePropertyAll(
                  BorderSide(color: Colors.white),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              child: Text(
                details.authScreenIndex == 0 ? 'Register' : 'Login',
                style: subHeadingBoldWhite,
              ),
            ),
            5.heightBox,
            Text(
              details.authScreenIndex == 0 ? "Haven't Account ?" : "Already Have a Account ?",
              style: priceText.copyWith(color: Colors.white),
            )*/
          ],
        ),
      );
    });
  }
}
