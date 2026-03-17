import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const SectionHeader({super.key, required this.title, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        GestureDetector(
          onTap: onViewAll,
          child: Row(
            children: const [
              Text(
                'View All',
                style: TextStyle(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 14, color: AppColors.primary),
            ],
          ),
        ),
      ],
    );
  }
}
