import 'package:event_app/utils/color_resources.dart';
import 'package:flutter/material.dart';

const TextStyle lightGreyText = TextStyle(fontSize: 12, color: Color.fromARGB(255, 113, 111, 111));

const TextStyle lightGreyTextLarge = TextStyle(fontSize: 16, color: Color.fromARGB(255, 113, 111, 111));

const TextStyle boldblackTextSmall = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black);

const TextStyle boldblackTextVerySmall = TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black);

const TextStyle priceText = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black);

const TextStyle heading1Bold = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

TextStyle heading1BoldWithShadow = heading1Bold.copyWith(shadows: [
  const Shadow(color: Colors.black38, blurRadius: 2, offset: Offset(0, 3))
]);

const TextStyle heading2Bold = TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black);

const TextStyle subHeadingBold = TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black);

const TextStyle subHeadingRed = TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.redAccent);

const TextStyle subHeadingPrimaryColor = TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: ColorResources.PRIMARY_MATERIAL);

const TextStyle redAccentText = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.redAccent);

const TextStyle subHeadingBoldWhite = TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white);

const TextStyle headingBoldWhite = TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white);

const TextStyle smallHeadingBold = TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black);

const TextStyle smallHeadingBoldGrey = TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.grey);

const TextStyle crossedPrice = TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough);

const TextStyle offPercentage = TextStyle(fontSize: 12, color: Colors.green);

const TextStyle profileLabelText = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 113, 111, 111));

const TextStyle activeOrderlabel = TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black);

const TextStyle inActiveOrderlabel = TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color.fromARGB(255, 113, 111, 111));

const TextStyle supplierName = TextStyle(fontSize: 16, color: Colors.black);
