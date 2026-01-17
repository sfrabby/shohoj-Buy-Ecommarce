import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../model/Single Product Model/GetSingleProductModel.dart';


class SingleProductDetail extends GetxController {
  RxBool isLoading = false.obs;
  var productData = Rxn<Data>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetDetail();
  }

  Future<GetSingleProductModel?> GetDetail() async {
    isLoading.value = true;

    try {
      var url = Uri.parse("https://b4.coderangon.com/api/products/2");
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
