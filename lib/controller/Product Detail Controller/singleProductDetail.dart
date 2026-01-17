import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../model/Single Product Model/GetSingleProductModel.dart';


class SingleProductDetail extends GetxController {
   late final int PID;
  RxBool isLoading = false.obs;
  var productData = Rxn<Data>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null && pid is int) {
      int pid = Get.arguments;
      GetDetail(pid);
    } else {
      log("No PID found in arguments!");
    }
    GetDetail(pid);
  }

  Future<GetSingleProductModel?> GetDetail(int pid) async {
    isLoading.value = true;
    productData.value = null;

    try {
      var url = Uri.parse("https://b4.coderangon.com/api/products/$pid");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var product = GetSingleProductModel.fromJson(jsonDecode(response.body));
        if (product.data != null) {
          productData.value = product.data!;
        }
      } else {
        throw Exception("Server Error ${response.statusCode}");
      }
    } catch (error) {
      log("Error is ${error.toString()}");
    } finally {
      isLoading.value = false;
    }
    return null;
  }
}
