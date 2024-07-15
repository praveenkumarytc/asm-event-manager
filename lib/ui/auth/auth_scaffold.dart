import 'package:event_app/ui/auth/components/auth_bottom_functionality.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/color_resources.dart';
import 'package:event_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, this.widget, this.onAuthButtonTap, this.isOTPPage = false});

  final Widget? widget;
  final Function()? onAuthButtonTap;

  final bool isOTPPage;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorResources.PRIMARY_MATERIAL,
      appBar: AppBar(
        backgroundColor: ColorResources.PRIMARY_MATERIAL,
        toolbarHeight: 20,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
          ),
          Positioned(
            top: 10.0.h(),
            left: 10,
            child: Image.asset(
              Images.asmLogo,
              height: 60,
            ),
          ),
          Positioned(
            top: 50.0.h(),
            right: 10,
            child: Image.asset(
              isOTPPage ? Images.otpIcon : Images.mobilePhoneIcon,
              color: Colors.white,
              height: 60,
            ),
          ),
          if (widget != null)
            Padding(
              padding: EdgeInsets.only(
                top: (SizeConfig.screenHeight * 0.12),
              ),
              child: widget!,
            ),
          if (onAuthButtonTap != null)
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: SwitchAuthScreens(
                onTap: onAuthButtonTap,
              ),
            ),
        ],
      ),
    );
  }
}
