import 'package:country_code_picker/country_code_picker.dart';
import 'package:event_app/helper/date_converter.dart';
import 'package:event_app/helper/show_toast.dart';
import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/ui/auth/components/asm_button.dart';
import 'package:event_app/ui/auth/components/signup_textfield.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.mobileController,
    required this.otpController,
    required this.fullNameController,
    required this.countryCodeController,
  });

  final TextEditingController emailController;
  final TextEditingController mobileController;

  final TextEditingController otpController;

  final TextEditingController passwordController;
  final TextEditingController fullNameController;
  final TextEditingController countryCodeController;

  CountryCode countryCode = CountryCode(code: '+91');

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, details, child) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Register your Account',
              style: headingBoldWhite,
            ),
            20.heightBox,
            SignupTextfield(
              controller: fullNameController,
              hintText: 'Enter full name',
              labelText: 'Full Name *',
            ),
            // 20.heightBox,
            // SignupTextfield(
            //   controller: mobileController,
            //   hintText: 'Mobile number with country code',
            //   labelText: 'Mobile Number *',
            //   keyboardType: TextInputType.number,
            //   maxLength: 10,
            // ),
            20.heightBox,
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.number,
              style: subHeadingBoldWhite,
              cursorColor: Colors.white,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              maxLength: 13,
              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
              decoration: InputDecoration(
                prefix: SizedBox(
                  width: 60,
                  child: CountryCodePicker(
                    alignLeft: true,
                    initialSelection: '+91',
                    padding: const EdgeInsets.only(),
                    showFlag: false,
                    textStyle: priceText.copyWith(color: Colors.white),
                    onChanged: (value) {
                      countryCode = value;

                      countryCodeController.text = value.dialCode!;
                      print(countryCodeController.text);
                    },
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                label: Text(
                  "Mobile Number *",
                  style: priceText.copyWith(color: Colors.white),
                ),
                hintText: "Enter Mobile Number",
                hintStyle: lightGreyTextLarge.copyWith(color: Colors.white),
              ),
            ),
            20.heightBox,
            SignupTextfield(
              controller: emailController,
              hintText: 'Email address',
              labelText: 'Email Address *',
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z0-9@._-]'),
                ),
              ],
              // suffixIcon: details.resendOtpTimer > 0
              //     ? TextButton(
              //         onPressed: null,
              //         child: Text(
              //           "Resend OTP (${details.resendOtpTimer.toString()})",
              //           style: lightGreyText.copyWith(color: Colors.white),
              //         ),
              //       )
              //     : TextButton(
              //         onPressed: () async {
              //           if (mobileController.text.length == 10) {
              //             KeyboardUtil.hideKeyboard(context);
              //             CustomLoader.show(context, text: 'Sending OTP');
              //             await Provider.of<AuthProvider>(context, listen: false)
              //                 .signupOtpRequest(
              //               context,
              //               mobileController.text,
              //             )
              //                 .then((response) {
              //               CustomLoader.hide(context);
              //               if (response!.status == AppConstants.success) {
              //                 // Provider.of<NotificationProvider>(context, listen: false).showOtpNotification(message: response.message);

              //                 showErrorSnackBar(context, response.message, isError: false);
              //               } else {
              //                 showErrorSnackBar(context, response.message);
              //               }
              //             });
              //           } else {
              //             showErrorSnackBar(context, 'Please enter 10 digit mobile number');
              //           }
              //         },
              //         child: Text(
              //           details.resendOtpCount > 0 ? 'Resend OTP' : 'Get OTP',
              //           style: lightGreyText.copyWith(color: Colors.white),
              //         ),
              //       ),
            ),
            20.heightBox,
            SignupTextfield(
              controller: passwordController,
              hintText: 'Password',
              labelText: 'Password *',
              obscureText: !details.passwordVisible,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
              ],
              suffixIcon: IconButton(
                onPressed: () {
                  details.changePasswordVisbility();
                },
                icon: Icon(
                  details.passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              ),
            ),
            20.heightBox,
          ],
        ),
      );
    });
  }

  selectDob(BuildContext context) async {
    await showDatePicker(
      context: context,
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        passwordController.text = DateConverter.estimatedDateBack(selectedDate);
      }
      debugPrint(selectedDate.toString());
    });
  }

  requestSignupOTP(BuildContext context) async {
    final otpController = TextEditingController();
    if (mobileController.text.length != 10) {
      showErrorSnackBar(context, 'Please enter 10 digit mobile number');
    } else if (otpController.text.length != 4) {
      showErrorSnackBar(context, 'Please enter 4 digit OTP');
    } else if (passwordController.text.isEmpty) {
      showErrorSnackBar(context, 'Please select your dob (yyyy-mm--dd)');
    } else if (emailController.text.isEmpty) {
      showErrorSnackBar(context, 'Please enter valid email address');
    } else {
      await Provider.of<AuthProvider>(context, listen: false).requestotp(context, emailController.text).then((sendResponse) {
        if (sendResponse?.status == AppConstants.success) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Enter Otp"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We have sent an otp to your emai ${emailController.text}",
                    style: lightGreyText,
                  ),
                  TextField(
                    controller: otpController,
                  )
                ],
              ),
              actions: [
                AsmButtonButton(
                  onTap: () {
                    // Provider.of<AuthProvider>(context, listen: false).verifyOtp(context, emailController.text, otpController.text).then((otpResponse) async {
                    //   if (otpResponse?.status == AppConstants.success) {
                    //     CustomLoader.show(context, text: 'Registering new user');
                    //     await Provider.of<AuthProvider>(context, listen: false).registerUser(context, mobileController.text, otpController.text, passwordController.text, '').then(
                    //       (response) {
                    //         CustomLoader.hide(context);
                    //         if (response!.status == AppConstants.success) {
                    //           // Navigator.pushAndRemoveUntil(
                    //           //     context,
                    //           //     MaterialPageRoute(
                    //           //       builder: (context) => const DashBoard(),
                    //           //     ),
                    //           //     (route) => false);
                    //         } else {
                    //           showErrorSnackBar(context, response.message);
                    //         }
                    //       },
                    //     );
                    //   } else {
                    //     showToast(isError: true, message: otpResponse?.message ?? "");
                    //   }
                    // });
                  },
                  child: Text(
                    "Verify Otp",
                    style: priceText.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          showErrorSnackBar(context, sendResponse?.message);
        }
      });
    }
  }
}
