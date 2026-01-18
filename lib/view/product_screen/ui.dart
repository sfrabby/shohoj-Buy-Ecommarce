import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/Colors.dart';

import '../../controller/Product Detail Controller/singleProductDetail.dart';
import '../../controller/Product page controller/productPageController.dart';
import '../../utils/widget/Shimer.dart';
import '../single_product_screen/ui.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final productController Controller = Get.put(productController());
  final String imageBaseUrl = "https://b4.coderangon.com/storage/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Products",
          style: TextStyle(
            color: BgColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: PrimaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (Controller.isLoading.value) {
            return buildProductShimmer();
          }
          return GridView.builder(
            itemCount: Controller.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              var product = Controller.productList[index];
              return Container(
                decoration: BoxDecoration(
                  color: SecondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                imageBaseUrl + (product.image ?? ""),
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: PrimaryColor.withOpacity(0.3),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title ?? "unknown product ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Price - \$${product.price?.toString() ?? "0.00"}",
                              style: const TextStyle(color: Colors.red),
                            ),
                            CommonButton(
                              child: Text("Add to Cart"),
                              onTap: () {
                                Get.to(
                                  () => ProductDetailScreen(),
                                  arguments: product.id,
                                );
                              },
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
