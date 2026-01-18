import 'dart:convert';
import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../model/Slider Model/SliderModel.dart';

class SliderController extends GetxController {
  RxBool isLoading = false.obs;
  var imageList = <Data>[].obs;

  @override
  void onInit() {
    getSlider();
    super.onInit();
  }

  Future<void> getSlider() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://b4.coderangon.com/api/sliders");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var slideResponse = SliderModel.fromJson(jsonDecode(response.body));

        if (slideResponse.data != null) {
          imageList.assignAll(slideResponse.data!);
        }
      } else {
        log("Server error ${response.statusCode}");
      }
    } catch (error) {
      log("Slider Error: ${error.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}
