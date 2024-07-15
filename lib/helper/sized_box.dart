import 'package:flutter/material.dart';

extension IntBoxExtension on int {
  Widget get heightBox => SizedBox(height: toDouble());
  Widget get widthBox => SizedBox(width: toDouble());
}

extension FullWidthButtonExtention on ElevatedButton {
  Widget get stylishButton => SizedBox(height: 47, width: double.infinity, child: this);
}
