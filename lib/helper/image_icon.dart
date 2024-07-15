import 'package:flutter/material.dart';

class ImageToIcon extends StatelessWidget {
  const ImageToIcon(this.imagePath, {Key? key, this.color = Colors.grey, this.onTap}) : super(key: key);
  final String imagePath;
  final Color color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ImageIcon(
        AssetImage(imagePath),
        color: color,
      ),
    );
  }
}
