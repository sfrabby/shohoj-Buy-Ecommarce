import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_buy/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Slider Controller/SliderController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("Home Screen", style: TextStyle(color: BgColor)),
        centerTitle: true,
      ),
      body: Obx(() {
        if (sliderController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return CarouselSlider(
          options: CarouselOptions(autoPlay: true, height: 180),
          items: sliderController.imageList.map((slider) {
            return Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://b4.coderangon.com/storage/${slider.image}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}
