import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/Category Controller/Category Controller.dart';
import '../../utils/widget/Category Shimmer.dart';

class CategoryProduct extends StatelessWidget {
  CategoryProduct({super.key});

  final CategoryController controller = Get.put(CategoryController());

  final baseUrl = "https://b4.coderangon.com/storage/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return buildCategorySkeleton();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Categories", style: TextStyle(fontWeight: FontWeight.w900)),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.CategoryList.length,
                itemBuilder: (context, index) {
                  var category = controller.CategoryList[index];
                  String imageUrl = "$baseUrl${category.image}".trim();
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(right: 15),
                        child: Image.network(imageUrl, fit: BoxFit.fill),
                        // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("$baseUrl ${category.image}"))),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          alignment: Alignment.center,
                          color: PrimaryColor,
                          height: 20,
                          width: 80,
                          child: Text(category.name.toString()),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
