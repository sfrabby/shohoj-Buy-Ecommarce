import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildProductDetailShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Carousel Slider Shimmer
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 20),
        // Title Shimmer
        Container(height: 25, width: 200, color: Colors.white),
        const SizedBox(height: 10),
        // Price Shimmer
        Container(height: 20, width: 100, color: Colors.white),
        const SizedBox(height: 10),
        // Rating & Stock Shimmer
        Container(height: 18, width: 150, color: Colors.white),
        const SizedBox(height: 5),
        Container(height: 18, width: 130, color: Colors.white),
        const SizedBox(height: 20),
        // Description Shimmer (Multiple lines)
        Container(height: 15, width: double.infinity, color: Colors.white),
        const SizedBox(height: 8),
        Container(height: 15, width: double.infinity, color: Colors.white),
        const SizedBox(height: 8),
        Container(height: 15, width: 250, color: Colors.white),
        const SizedBox(height: 30),
        // Button Shimmer
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
  );
}