import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../model/Get Product Model/Get Product Model.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  // অবজারভেবল লিস্ট যেখানে ডাটা স্টোর হবে
  var productList = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    // ক্যাটাগরি আইডি আর্গুমেন্ট হিসেবে রিসিভ করা
    if (Get.arguments != null) {
      getProduct(cid: Get.arguments);
    }
  }

  Future<void> getProduct({required var cid}) async {
    isLoading.value = true;
    try {
      // নির্দিষ্ট ক্যাটাগরির জন্য URL ফিক্স করা হয়েছে
      var url = Uri.parse("https://b4.coderangon.com/api/products/$cid");
      var response = await http.get(url);

      log("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var productModel = ProductModel.fromJson(responseData);

        if (productModel.data != null) {
          productList.assignAll(productModel.data!);
          log("Data Loaded Successfully: ${productList.length}");
        }
      } else {
        log("Server error ${response.statusCode}");
      }
    } catch (error) {
      log("Catch Error: ${error.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}