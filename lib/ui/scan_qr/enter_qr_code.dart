import 'package:event_app/helper/show_toast.dart';
import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/ui/custom_widgets/custom_textfield.dart';
import 'package:event_app/ui/custom_widgets/primary_button.dart';
import 'package:event_app/utils/size_config.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';

class EnterQrCode extends StatelessWidget {
  EnterQrCode({super.key, required this.onQrSubmit});

  final dynamic Function(String, dynamic Function()) onQrSubmit;

  final TextEditingController qrTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          (SizeConfig.screenHeight * 0.2).toInt().heightBox,
          CustomTextFormField(
            controller: qrTextController,
            isOtpField: true,
            textCapitalization: TextCapitalization.none,
            inputTextStyle: heading1Bold.copyWith(color: Colors.white),
            hinttext: 'Enter Code',
            maxLines: 1,
            maxLenghth: 24,
          ),
          (SizeConfig.screenHeight! * 0.1).toInt().heightBox,
          PrimaryButton(
            onTap: () {
              String qrText = qrTextController.text;

              if (qrText.isEmpty) {
                showToast(isError: false, message: 'Please enter code');
              } else {
                onQrSubmit(qrText, () {
                  Navigator.pop(context);
                });
              }
            },
            title: 'Submit',
            height: 45,
          )
        ],
      ),
    );
  }
}
