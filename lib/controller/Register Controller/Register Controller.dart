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

      var BodyData = {
        registerModel().user?.name = NameC.text.trim(),
        registerModel().user?.phone = PhoneC.text.trim(),
        registerModel().user?.email = EmailC.text.trim(),
        registerModel().user?.address = AddressC.text.trim(),
      };
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json",
          "Accept": "application/json"},
        body: jsonEncode(registerModel().toJson()),
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
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
