import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/product_screen/ui.dart';

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
        var responseData = jsonDecode(response.body);
        String token = responseData['token'];
        log("Token saved ${token}");
        var box = GetStorage();
        box.write("token", token);
        Get.snackbar("Success", "Account login successfully!");
        PhoneController.clear();
        passwordController.clear();
       Get.offAll(()=>ProductScreen());
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

