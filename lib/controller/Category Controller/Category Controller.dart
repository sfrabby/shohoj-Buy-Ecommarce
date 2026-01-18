import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../model/Catogary Model/Catogary Model.dart';

class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  final CategoryList = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetCategory();
  }

  Future<void> GetCategory() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://b4.coderangon.com/api/categories");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var Category = CategoryModel.fromJson(jsonDecode(response.body));
        if (Category.data != null) {
          CategoryList.assignAll(Category.data!);
        }
      } else {
        log("Server error ${response.statusCode}");
      }
    } catch (error) {
      log(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
