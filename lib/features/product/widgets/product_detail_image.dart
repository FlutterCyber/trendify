import 'package:flutter/material.dart';

class ProductDetailImage extends StatelessWidget {
  final String image;

  const ProductDetailImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: 380,
      fit: BoxFit.cover,
    );
  }
}
