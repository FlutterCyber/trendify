import 'package:flutter/material.dart';
import 'package:trendify/core/theme/app_colors.dart';

class ProductDetailHeader extends StatelessWidget {
  final String title;
  final double price;
  final double originalPrice;
  final int soldCount;
  final double rating;

  const ProductDetailHeader({
    super.key,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.soldCount,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '\$$price',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '\$$originalPrice',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFAAAAAA),
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${_formatNumber(soldCount)} sold',
              style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
            ),
            const Spacer(),
            const Icon(Icons.star, color: Color(0xFFFFA800), size: 16),
            const SizedBox(width: 4),
            Text(
              '$rating',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  String _formatNumber(int n) => n
      .toString()
      .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');
}
