import 'dart:convert';
import 'dart:developer';
import 'package:e_buy/view/home_screen/ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class loginController extends GetxController {
  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<dynamic> userLogin() async {
    try {
      isLoading.value= true;
      var url = Uri.parse("https://b4.coderangon.com/api/login");
      Map<String,dynamic> data = {"phone": PhoneController.text, "password": passwordController.text};
      var response = await http.post(
        url,
        headers: {"Accept": "application/json",
          "Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        log("Login Success: ${response.body}");
        FlutterSecureStorage storage = FlutterSecureStorage();
        storage.write(key: "token", value: response.body);
        Get.snackbar("Success", "Account login successfully!");
        PhoneController.clear();
        passwordController.clear();
       Get.offAll(()=>HomeScreen());
      }
      else{
        throw Exception("Login Api Error ${response.body}");
      }
    } catch (error) {
      log(error.toString());
    }
    finally{
      isLoading.value= false;
    }
  }
}
