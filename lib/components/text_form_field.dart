import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String? hintText;
  String? labelText;
  IconData? prefixIcon;
  TextInputType? inputType;

  CustomTextFormField(
      {this.controller,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.inputType});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller!,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        labelText: widget.labelText!,
        hintText: widget.hintText!,
        border: OutlineInputBorder(),
      ),
      keyboardType: widget.inputType!,
    );
  }
}
