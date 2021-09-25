import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tracker/common/style.dart';

class ShimmerRecentCard extends StatelessWidget {
  const ShimmerRecentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      shadowColor: primaryColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Shimmer.fromColors(
              baseColor: whiteColor,
              highlightColor: primaryColor,
              child: Container(
                width: 48,
                height: 48,
                color: primaryColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                        baseColor: whiteColor,
                        highlightColor: primaryColor,
                        child: Container(
                            width: 100, height: 18, color: primaryColor)),
                    const SizedBox(height: 4),
                    Shimmer.fromColors(
                        baseColor: whiteColor,
                        highlightColor: primaryColor,
                        child: Container(
                            width: 100, height: 18, color: primaryColor)),
                    const SizedBox(height: 4),
                    Shimmer.fromColors(
                        baseColor: whiteColor,
                        highlightColor: primaryColor,
                        child: Container(
                            width: 100, height: 18, color: primaryColor)),
                  ],
                ),
              ),
            ),
            Shimmer.fromColors(
                baseColor: whiteColor,
                highlightColor: primaryColor,
                child: Container(width: 80, height: 20, color: primaryColor)),
          ],
        ),
      ),
    );
  }
}
