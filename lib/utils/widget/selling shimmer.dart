import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class SellingShimmer extends StatelessWidget {
  SellingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // ৫টি ডামি কার্ড দেখাবে
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 180,
              margin: const EdgeInsets.only(right: 12, bottom: 8, top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ইমেজের জন্য শিমার
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                    ),
                  ),
                  // টেক্সটের জন্য শিমার
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 120, height: 15, color: Colors.white),
                        const SizedBox(height: 8),
                        Container(width: 80, height: 12, color: Colors.white),
                        const SizedBox(height: 8),
                        Container(width: double.infinity, height: 30, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}