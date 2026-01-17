import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/controller/Product%20Detail%20Controller/singleProductDetail.dart';
import 'package:e_buy/utils/widget/Shimer.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key,});

  final SingleProductDetail Controller = Get.put(SingleProductDetail());
  final String imageBaseUrl = "https://b4.coderangon.com/storage/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios, color: BgColor,)),
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

                if (Controller.productData.value == null) {
                  return const Center(
                    child: Text("Product not found or Server Error!"),
                  );
                }

                var product = Controller.productData.value;
                List<String> images = product?.gallery ?? [];

                // যদি গ্যালারি খালি থাকে তবে মেইন ইমেজটি লিস্টে ঢুকিয়ে দিন
                if (images.isEmpty && product?.image != null) {
                  images.add(product!.image!);
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Carousel Slider ---
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
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[100],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  imageBaseUrl + imgUrl,
                                  fit: BoxFit.cover,
                                  //headers: const {"User-Agent": "Mozilla/5.0"},
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.broken_image,
                                        size: 50,
                                        color: Colors.red,
                                      ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: spaceBtwSection),

                    // --- Product Info ---
                    Text(
                      product?.title ?? "Product Name",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          "৳${product?.price}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (product?.oldPrice != null)
                          Text(
                            "৳${product?.oldPrice}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: spaceBtwItem),

                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        Text(
                          " ${product?.rating ?? 0.0} (${product?.reviewCount ?? 0} Reviews)",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Text("stock - ${product!.stock} items available"),

                    const SizedBox(height: 20),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product?.description ?? "No description available.",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Buy Now Button
                    CommonButton(
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onTap: () {},
                      height: 50,
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
