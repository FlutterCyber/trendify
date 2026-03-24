import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback? onTap;

  const CategoryGridItem({
    super.key,
    required this.label,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Image.asset(image, width: 60, height: 60, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
