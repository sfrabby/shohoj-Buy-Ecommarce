import 'package:e_buy/view/auth/login/ui.dart';
import 'package:e_buy/view/auth/register/ui.dart';
import 'package:e_buy/view/home_screen/ui.dart';
import 'package:e_buy/view/splash_screen/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/RegistrationScreen', page: () => RegistrationScreen()),
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
   debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}
