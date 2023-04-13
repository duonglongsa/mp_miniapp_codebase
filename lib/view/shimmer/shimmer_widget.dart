import 'package:flutter/material.dart';
import 'package:mp_shimmer/mp_shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  ShimmerWidget({key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.1),
      period: const Duration(milliseconds: 1000),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
