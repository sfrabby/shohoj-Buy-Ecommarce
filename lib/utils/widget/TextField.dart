import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/Colors.dart';

class Textfields extends StatelessWidget {
  final FormFieldValidator validator;
  final String HintText;
  final TextEditingController Controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const Textfields({
    super.key,
    required this.validator,
    required this.HintText,
    required this.Controller,
     this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      validator: validator,
      cursorColor: PrimaryColor,
      decoration: InputDecoration(
        hintText: HintText,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon  ,

        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: PrimaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: PrimaryColor, width: 2),
        ),
      ),
    );
  }
}
