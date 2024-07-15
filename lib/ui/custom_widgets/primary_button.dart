import 'package:flutter/material.dart';

import '../../Utils/color_resources.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onTap, required this.title, this.height = 40});
  final Function() onTap;
  final String title;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: const BoxConstraints(minWidth: 150),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorResources.COLOR_BLUE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          title,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}

const TextStyle buttonTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
