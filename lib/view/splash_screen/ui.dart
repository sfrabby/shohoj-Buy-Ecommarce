import 'package:e_buy/view/home_screen/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
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

    FlutterSecureStorage storage = FlutterSecureStorage();
    var token = await storage.read(key: "token");
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
    return Scaffold(body: Center(child: Image.asset(logo1)));
  }
}
