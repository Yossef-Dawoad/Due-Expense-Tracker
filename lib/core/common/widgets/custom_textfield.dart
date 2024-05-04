import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.readOnly = false,
    this.controller,
    this.onInit,
    this.onTap,
    this.suffixIcon,
    this.contentPadding = 24.0,
    this.hintTextStyle,
    this.showBorder = false,
    this.maxLines = 1,
    this.fillColor = Colors.white,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onInit;
  final VoidCallback? onTap;
  final bool readOnly;
  final double contentPadding;
  final TextStyle? hintTextStyle;
  final bool showBorder;
  final int maxLines;
  final Color fillColor;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      textAlignVertical: TextAlignVertical.center,
      style: f14greyRegularText.copyWith(fontSize: 20),
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        contentPadding: EdgeInsets.all(widget.contentPadding),
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle,
        border: OutlineInputBorder(
          borderSide: widget.showBorder
              ? const BorderSide(color: Colors.blue)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
