import 'package:e_buy/constants/Colors.dart';
import 'package:e_buy/constants/SizeBox.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("Product Details", style: TextStyle(color: BgColor, fontSize: 22),),
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
                SizedBox(height: spaceBtwSection,),
                Text("Mens Formal Shirt", style: TextStyle(fontSize: 20),)
              ],

            ),
          )
        ],
      ),
    );
  }
}
