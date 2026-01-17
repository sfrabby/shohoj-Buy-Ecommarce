import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/view/home_screen/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/images.dart';
import '../auth/login/ui.dart';
import '../auth/register/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void Nav() async {
    await Future.delayed(Duration(seconds: 3));

    final box = GetStorage();

    var token = box.read("token");

    if (token == null) {
      Get.to(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    Nav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BgColor,
        body: Center(child: Image.asset(logo1)));
  }
}
