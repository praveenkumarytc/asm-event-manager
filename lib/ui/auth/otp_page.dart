import 'package:event_app/helper/custom_loder.dart';
import 'package:event_app/helper/show_toast.dart';
import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/ui/booths/booth_listing.dart';
import 'package:event_app/ui/auth/auth_scaffold.dart';
import 'package:event_app/ui/auth/components/asm_button.dart';
import 'package:event_app/ui/dash_board.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.mobile});
  final String? mobile;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.white),
      color: Colors.blue.shade400,
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.blue.shade400,
      ),
    );

    return AuthScaffold(
      isOTPPage: true,
      widget: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.heightBox,
            const Text(
              'Enter Your Mobile Number',
              style: headingBoldWhite,
            ),
            Text(
              'An OTP has been sent to your mobile number: ${widget.mobile}.',
              style: lightGreyText.copyWith(color: Colors.grey.shade200),
            ),
            30.heightBox,
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Pinput(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  showCursor: true,
                  onCompleted: (pin) {},
                ),
              ),
            ),
            80.heightBox,
            AsmButtonButton(
              onTap: () async {
                if (otpController.text.length < 4) {
                  showErrorSnackBar(context, 'Please enter 4 digit OTP');
                } else {
                  CustomLoader.show(context, text: 'Validating OTP');
                  await Provider.of<AuthProvider>(context, listen: false).verifyOtp(context, widget.mobile, otpController.text).then((response) {
                    CustomLoader.hide(context);
                    if (response?.status == AppConstants.success) {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    } else {
                      showErrorSnackBar(context, response?.message);
                    }
                  });
                }
              },
              child: const Text(
                'Verify',
                style: subHeadingBoldWhite,
              ),
            ),
          ],
        ),
      ),
      // onAuthButtonTap: () {},
    );
  }
}
