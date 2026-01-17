import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../model/Get Product Model/Get Product Model.dart';

class SingleProductDetail extends GetxController {
  RxBool isLoading = false.obs;
  var productList = [].obs;

  Future<GetProductModel?> GetDetail() async {
    isLoading.value = true;

    try {
      var url = Uri.parse("https://b4.coderangon.com/api/products/2");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var product = GetProductModel.fromJson(jsonDecode(response.body));
        if (product.data != null) {
          productList.value = product.data!;
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
