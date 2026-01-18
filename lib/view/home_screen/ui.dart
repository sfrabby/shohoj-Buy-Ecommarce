import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/controller/Category%20Controller/Category%20Controller.dart';
import 'package:e_buy/view/Category%20Product/Category%20Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final imageList = [
    "https://img.freepik.com/premium-psd/website-shoppers-showing-woman-with-tablet-bag_1130490-123.jpg",
    "https://img.freepik.com/premium-vector/3d-perspective-mobile-phone-with-online-shopping-icons-web-banner-landing-page-e-commerce-app_773186-409.jpg",
    "https://www.shutterstock.com/image-vector/banner-announcing-mega-discount-half-260nw-1962489325.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        elevation: 5,
        centerTitle: true,
        title: Text("Home Screen", style: TextStyle(color: BgColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  viewportFraction: 0.9,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imageList.map((i) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      i,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      headers: const {"User-Agent": "Mozilla/5.0"},
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 50),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: CategoryProduct(),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
