import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

shimmerx() => Shimmer.fromColors(
  baseColor: Colors.grey[850]!,
  highlightColor: Colors.grey[800]!,
  child: Container(
    height: 170.0,
    width: 120.0,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);

SizedBox shimmer2() {
  return SizedBox(
    height: 170.0,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => shimmerx(),
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemCount: 5,
    ),
  );
}
