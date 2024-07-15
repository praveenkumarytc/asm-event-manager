// ignore_for_file: camel_case_types

import 'package:event_app/helper/number_text_input.dart';
import 'package:event_app/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Utils/light_color.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.suffixIcon,
    this.controller,
    this.hinttext,
    this.labelText,
    this.maxLines,
    this.maxLenghth,
    this.keyBoardType,
    this.onChanged,
    this.isEnabled = true,
    this.onTap,
    this.onButtonTap,
    this.labelColor = ColorResources.PRIMARY_MATERIAL,
    this.textCapitalization = TextCapitalization.sentences,
    this.isOtpField = false,
    this.focusNode,
    this.inputTextStyle,
    this.prefix,
    this.inputFormatters,
    this.readOnly = false,
  }) : super(key: key);
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final String? hinttext;
  final String? labelText;
  final int? maxLines;
  final int? maxLenghth;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;
  final bool? isEnabled;
  final Function()? onTap;
  final Function()? onButtonTap;
  final Color labelColor;
  final TextCapitalization textCapitalization;
  final bool isOtpField;
  final FocusNode? focusNode;
  final TextStyle? inputTextStyle;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: TextFormField(
        readOnly: widget.readOnly,
        style: widget.inputTextStyle,
        maxLength: widget.maxLenghth,
        maxLines: widget.maxLines,
        textAlign: widget.isOtpField ? TextAlign.center : TextAlign.left,
        controller: widget.controller,
        enabled: widget.isEnabled,
        keyboardType: widget.keyBoardType,
        textCapitalization: widget.textCapitalization,
        inputFormatters: widget.keyBoardType == numberKeyBoard ? digitOnlyFormater : widget.inputFormatters,
        onChanged: widget.onChanged,
        buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(22, 14, 0, 14),
          suffixIcon: GestureDetector(
            onTap: widget.onButtonTap,
            child: SizedBox(
              width: 50,
              child: widget.suffixIcon,
            ),
          ),
          prefixIcon: widget.prefix,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.6),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          isDense: true,
          hintText: widget.hinttext,
          floatingLabelStyle: TextStyle(color: widget.labelColor, fontWeight: FontWeight.normal),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.6),
          ),
          hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.normal, fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: ColorResources.PRIMARY_MATERIAL, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(22, 14, 14, 14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        isDense: true,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.normal),
        labelText: 'Select an item',
        labelStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.normal),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}

List<TextInputFormatter>? digitOnlyFormater = [
  FilteringTextInputFormatter.digitsOnly
];
