import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../constants/Colors.dart';
import '../../controller/Category Wise Product Controller/CategoryWiseController.dart';
import '../../utils/widget/commonButton.dart';
import '../../utils/widget/selling shimmer.dart';
import '../single_product_screen/ui.dart';

class HotSellingProduct extends StatelessWidget {
  HotSellingProduct({super.key});
  final SellingTypeController Controller = Get.put(SellingTypeController());
  final String imageBaseUrl = "https://b4.coderangon.com/storage/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){

        if (Controller.hotSellingList.isEmpty) {
          return  SellingShimmer();
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hot Selling Product",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Controller.hotSellingList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = Controller.hotSellingList[index];
                  return Container(
                    width:
                    180,

                    margin: const EdgeInsets.only(
                      right: 12,
                      bottom: 8,
                      top: 8,
                    ),

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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['title'] ?? "unknown product",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Price - \$${product['price']?.toString() ??
                                    "0.00"}",
                                style: const TextStyle(color: Colors.red),
                              ),
                              const SizedBox(height: 5),
                              // ৫. বাটনটিকে নির্দিষ্ট সাইজে রাখার জন্য
                              SizedBox(
                                width: double.infinity,
                                child: CommonButton(
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onTap: () {
                                    Get.to(
                                          () => ProductDetailScreen(),
                                      arguments:
                                      product['id'], // এখানেও product.id এর বদলে product['id'] দিন
                                    );
                                  },
                                  height:
                                  30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );

      }
      ),
    );
  }
}
