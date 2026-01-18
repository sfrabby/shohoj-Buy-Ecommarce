import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../constants/Colors.dart';
import '../../controller/Category Wise Product Controller/CategoryWiseController.dart';
import '../../utils/widget/commonButton.dart';
import '../single_product_screen/ui.dart';

class TopSellingProduct extends StatelessWidget {
   TopSellingProduct({super.key});
   final SellingTypeController Controller = Get.put(SellingTypeController());
  final String imageBaseUrl = "https://b4.coderangon.com/storage/" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Top Selling Product", style: TextStyle(fontWeight: FontWeight.w500),),
          SizedBox(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Controller.hotSellingList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var product = Controller.hotSellingList[index];
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
                                imageBaseUrl + (product['image'] ?? ""),
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
                              product['title'] ?? "unknown product ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Price - \$${product['price']?.toString() ?? "0.00"}",
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
            },),
          )
        ],
      ),
    );
  }
}
