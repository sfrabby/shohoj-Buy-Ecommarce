import 'dart:convert';
import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../model/Category Wise Model/CategoryWiseModel.dart';

class CategoryWiseController extends GetxController {
  RxBool isLoading = false.obs;
  var productData = Data().obs;


  Future<void> fetchCategoryProducts(int categoryId) async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://b4.coderangon.com/api/category/$categoryId");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var model = CatogaryWiseModel.fromJson(jsonDecode(response.body));
        if (model.data != null) {
          productData.value = model.data!;
        }
      } return null;
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}