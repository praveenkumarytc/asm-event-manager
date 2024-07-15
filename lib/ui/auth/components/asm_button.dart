import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/utils/color_resources.dart';
import 'package:flutter/material.dart';

class AsmButtonButton extends StatelessWidget {
  const AsmButtonButton({super.key, required this.onTap, required this.child, this.width, this.hieght});
  final Function()? onTap;
  final Widget child;
  final double? width, hieght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght ?? 47,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: ColorResources.PRIMARY_MATERIAL,
        ),
        child: child,
      ).stylishButton,
    );
  }
}
