import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:e_buy/utils/widget/commonButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: SecondaryColor,
                  ),
                ),
                SizedBox(height: spaceBtwSection),
                Text("Mens Formal Shirt", style: TextStyle(fontSize: 20)),
                Text("Price -5000", style: TextStyle(color: Colors.red)),
                Text("Product Rating - 5.5", style: TextStyle(fontSize: 16)),
                Text(
                  "A shirt is a versatile upper-body garment, typically cloth, with sleeves, a neck opening, and often a collar and front buttons, made from materials like cotton, silk, or polyester, coming in styles from casual tees to formal dress shirts, designed for comfort, protection, and style. Descriptions highlight material,",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: spaceBtwSection,),
                CommonButton(child: Text("Buy Now"), onTap: (){}, height: 50)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
