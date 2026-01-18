import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SellingTypeController extends GetxController {
  RxBool isLoading = false.obs;

  // ১. সরাসরি ডাটা রাখার জন্য RxMap এবং RxList ব্যবহার করা
  RxMap sellData = {}.obs;
  RxList hotSellingList = [].obs;
  RxList topSellingList = [].obs;
  RxList newProductList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getSellType();
  }

  Future<void> getSellType() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://b4.coderangon.com/api/home-products");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body)['data'];

        hotSellingList.value = responseData['hot-selling'] ?? [];
        topSellingList.value = responseData['top-selling'] ?? [];
        newProductList.value = responseData['new-product'] ?? [];

        log("Data Loaded Successfully");
      } else {
        log("Server error: ${response.statusCode}");
      }
    } catch (error) {
      log("Error: ${error.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}