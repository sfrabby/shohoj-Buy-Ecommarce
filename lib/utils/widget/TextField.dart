import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/Colors.dart';

class Textfields extends StatelessWidget {
  final FormFieldValidator validator;
  final String HintText;
  final TextEditingController Controller;

  const Textfields({
    super.key, required this.validator, required this.HintText, required this.Controller,
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
        suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
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