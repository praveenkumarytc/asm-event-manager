import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:event_app/helper/custom_loder.dart';
import 'package:event_app/helper/show_toast.dart';
import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/ui/auth/auth_scaffold.dart';
import 'package:event_app/ui/auth/otp_page.dart';
import 'package:event_app/ui/auth/signup_page.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController dobController = TextEditingController();
  CountryCode countryCode = CountryCode(dialCode: '+91', code: 'IN');

  Country mobileCountry = Country(
    phoneCode: '91', // India's phone code
    countryCode: 'IN', // India's country code
    e164Sc: 0, // example value, you can update it if needed
    geographic: true, // example value, you can update it if needed
    level: 1, // example value, you can update it if needed
    name: 'India', // Country name
    example: '9123456789', // example phone number, you can update it if needed
    displayName: 'India (+91)', // Display name
    displayNameNoCountryCode: 'India', // Display name without country code
    e164Key: '91-IN-0', // example value, you can update it if needed
  );

  @override
  void initState() {
    countryCodeController.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, details, child) {
        return AuthScaffold(
          widget: details.authScreenIndex == 1
              ? SignupPage(
                  passwordController: passwordController,
                  emailController: emailController,
                  mobileController: mobileController,
                  otpController: otpController,
                  fullNameController: fullNameController,
                  countryCodeController: countryCodeController,
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter Your Mobile Number',
                        style: headingBoldWhite,
                      ),
                      Text(
                        'We will send you a confirmation code.',
                        style: lightGreyText.copyWith(color: Colors.grey.shade200),
                      ),
                      20.heightBox,
                      // LoginTextField(
                      //   mobileController: emailController,
                      //   hintText: 'Username/ Email',
                      //   textFieldType: LoginTextFieldType.username,
                      //   authProvider: details,
                      // ),

                      SizedBox(
                        height: 60,
                        child: TextField(
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                          style: subHeadingBoldWhite,
                          cursorColor: Colors.white,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          maxLength: 10,
                          buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                          decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              width: 60,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        showPhoneCode: true, // optional. Shows phone code before the country name.
                                        onSelect: (Country country) {
                                          setState(() {
                                            mobileCountry = country;
                                          });
                                        },
                                      );
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        countryCodeToEmoji(mobileCountry.countryCode),
                                        style: heading1Bold,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        showPhoneCode: true, // optional. Shows phone code before the country name.
                                        onSelect: (Country country) {
                                          setState(() {
                                            print('Select country: ${country.displayName}');
                                            mobileCountry = country;
                                          });
                                        },
                                      );
                                    },
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            isDense: true, // Added this
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            hintText: mobileCountry.phoneCode,
                            hintStyle: lightGreyTextLarge,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          ),
                        ),
                      )

                      /*   30.heightBox,
                      LoginTextField(
                        mobileController: passwordController,
                        hintText: 'Password',
                        authProvider: details,
                        textFieldType: LoginTextFieldType.password,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              routeCuperTo(context, ForgotPasswordPage());
                            },
                            child: const Text(
                              "Forgot Password ?",
                              style: subHeadingBoldWhite,
                            ),
                          )
                        ],
                      )*/
                      ,
                      // AsmButtonButton(
                      //   onTap: () async {},
                      //   child: const Text(
                      //     'Submit',
                      //     style: subHeadingBoldWhite,
                      //   ),
                      // )
                    ],
                  ),
                ),
          onAuthButtonTap: () => onLogin(),
        );
      },
    );
  }

  onLogin() async {
    if (mobileController.text.length < 10) {
      showErrorSnackBar(context, 'Please enter mobile number');
    } else {
      CustomLoader.show(context, text: 'Sending Otp');
      await Provider.of<AuthProvider>(context, listen: false).loginOtpRequest(context, mobileController.text).then((response) {
        CustomLoader.hide(context);
        if (response?.status == AppConstants.success) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(
                  mobile: mobileController.text,
                ),
              ),
              (route) => false);
        } else {
          showErrorSnackBar(context, response?.message);
        }
      });
    }
  }
}

String countryCodeToEmoji(String countryCode) {
  // 0x41 is Letter A
  // 0x1F1E6 is Regional Indicator Symbol Letter A
  // Example :
  // firstLetter U => 20 + 0x1F1E6
  // secondLetter S => 18 + 0x1F1E6
  // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
  final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
  final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}
