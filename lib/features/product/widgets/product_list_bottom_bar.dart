import 'package:flutter/material.dart';
import 'package:trendify/core/theme/app_colors.dart';

class ProductListBottomBar extends StatelessWidget {
  final VoidCallback onSort;
  final VoidCallback onFilter;

  const ProductListBottomBar({
    super.key,
    required this.onSort,
    required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _BarButton(
            icon: Icons.swap_vert,
            label: 'Sort',
            onTap: onSort,
          ),
          const SizedBox(width: 20),
          const SizedBox(
            height: 20,
            child: VerticalDivider(color: AppColors.greyLight, width: 1),
          ),
          const SizedBox(width: 20),
          _BarButton(
            icon: Icons.tune,
            label: 'Filter',
            onTap: onFilter,
          ),
        ],
      ),
    );
  }
}

class _BarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _BarButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.black),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
