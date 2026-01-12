import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/register/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void Nav()async{
    await Future.delayed(Duration(seconds: 3));
    Get.to(RegistrationScreen());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Nav();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/ShohojBuy.png"),
      ),
    );
  }
}
