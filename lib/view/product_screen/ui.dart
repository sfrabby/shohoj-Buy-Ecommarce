import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final image = [

    "https://images.herzindagi.info/img-affiliate/2025/Jun/833927.webp",
    "https://5.imimg.com/data5/SELLER/Default/2023/8/331312932/UR/NE/DF/190567145/trousers-formal.jpg",
    "https://www.jagranimages.com/images/newimg/02042024/02_04_2024-formal_shirts_for_men_23688324.jpg"
  ];


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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    carouselController: CarouselSliderController(),
                    options: CarouselOptions(

                        autoPlay: true,
                        height: 200.0),
                    items: image.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(i))),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: spaceBtwSection),
                  Text("Mens Formal Shirt", style: TextStyle(fontSize: 20)),
                  Text("Price -5000", style: TextStyle(color: Colors.red)),
                  Text("Product Rating - 5.5", style: TextStyle(fontSize: 16)),
                  Text("Stock - Available", style: TextStyle(fontSize: 16)),

                  SizedBox(height: spaceBtwSection),

                  Text(
                    "A shirt is a versatile upper-body garment, typically cloth, with sleeves, a neck opening, and often a collar and front buttons, made from materials like cotton, silk, or polyester, coming in styles from casual tees to formal dress shirts, designed for comfort, protection, and style. Descriptions highlight material,",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: spaceBtwSection),
                  CommonButton(
                    child: Text("Buy Now", style: TextStyle(fontSize: 18)),
                    onTap: () {},
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
