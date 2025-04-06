import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListItem extends StatelessWidget {
  const ShimmerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[600]!,
      highlightColor: Colors.grey[400]!,
      child: ListTile(
        leading: Container(width: 36, height: 36, color: Colors.grey),
        title: Container(width: 100, height: 15, color: Colors.grey),
        subtitle: Container(width: 80, height: 12, color: Colors.grey),
        trailing: Container(width: 70, height: 15, color: Colors.grey),
      ),
    );
  }
}
