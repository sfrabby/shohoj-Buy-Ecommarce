import 'package:e_buy/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CommonButton extends StatelessWidget {
  final dynamic child;
  final Callback onTap;
  final double height;
  const CommonButton({super.key, required this.child, required this.onTap, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: PrimaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
