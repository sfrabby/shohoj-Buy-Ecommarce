import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/Register Model/RegisterModel.dart';

class registerController extends GetxController {
  RxBool isLoading = false.obs;

  final TextEditingController NameC = TextEditingController();
  final TextEditingController EmailC = TextEditingController();
  final TextEditingController PhoneC = TextEditingController();
  final TextEditingController AddressC = TextEditingController();
  final TextEditingController PasswordC = TextEditingController();



  Future<dynamic> userRegister() async {
    try {
      isLoading.value = true;
      var url = Uri.parse("https://b4.coderangon.com/api/register");

      Map<String, String> data = {
        "name": NameC.text.trim(),
        "phone": PhoneC.text.trim(),
        "email": EmailC.text.trim(),
        "address": AddressC.text.trim(),
        "password": PasswordC.text.trim(),
      };
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json",
          "Accept": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        log("Registration Success: ${response.body}");
        Get.snackbar("Success", "Account created successfully!");
        NameC.clear();
        EmailC.clear();
        PhoneC.clear();
        AddressC.clear();
        PasswordC.clear();
      } else {
        throw Exception("register Api error ${response.body}");
      }
    } catch (error) {
      log(error.toString());
    }
    finally{
      isLoading.value = false;
    }
  }
}
