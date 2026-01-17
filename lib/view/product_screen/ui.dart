import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/controller/Product%20Detail%20Controller/singleProductDetail.dart';
import 'package:e_buy/utils/widget/Shimer.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});


  final SingleProductDetail Controller = Get.put(SingleProductDetail());
  final String imageBaseUrl = "https://b4.coderangon.com/storage/";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          "Product Details",
          style: TextStyle(color: BgColor, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(() {
                if (Controller.isLoading.value) return buildProductShimmer();

                // গ্যালারি লিস্টটি বের করে নিন
                List<String> images = Controller.productData.value?.gallery ?? [];

                // যদি গ্যালারি খালি থাকে কিন্তু মেইন ইমেজ থাকে, তবে সেটি লিস্টে যোগ করুন
                if (images.isEmpty && Controller.productData.value?.image != null) {
                  images.add(Controller.productData.value!.image!);
                }

                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 250.0,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                      ),
                      items: images.map((imgUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[100],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  imageBaseUrl + imgUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 50),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Controller.productData.value?.title ?? "",
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Text("Price: ৳${Controller.productData.value?.price}",
                              style: const TextStyle(color: Colors.red, fontSize: 18)),
                          const SizedBox(height: 10),
                          Text(Controller.productData.value?.description ?? ""),
                        ],
                      ),
                    ),
                  ],
                );
              })
            ),
          ],
        ),
      ),
    );
  }
}
