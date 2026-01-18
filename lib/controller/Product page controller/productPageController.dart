import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/Get Product Model/Get Product Model.dart';

class productController extends GetxController {



  RxBool isLoading = false.obs;
  var productList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }


  Future<GetProductModel?> getProduct() async {
    isLoading.value=true;
    try {
      var url = Uri.parse("https://b4.coderangon.com/api/products");
      var response = await http.get(url);
      if (response.statusCode == 200) {
       var product = GetProductModel.fromJson(jsonDecode(response.body));
       if(product.data!=null){
         productList.value = product.data!;
       }
       else{
         log("server Error${response.statusCode}");
       }
      }
    } catch (error) {
      log(error.toString());
    }
    finally{
      isLoading.value= false;
    }
    return null;
  }

}
