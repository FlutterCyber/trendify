import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SortFilterBar extends StatelessWidget {
  final VoidCallback onSortTap;
  final VoidCallback onFilterTap;

  const SortFilterBar({
    super.key,
    required this.onSortTap,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onSortTap,
            child: const Row(
              children: [
                Icon(Icons.swap_vert, size: 18, color: Color(0xFF1A1A1A)),
                SizedBox(width: 6),
                Text(
                  'Sort',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 18,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: const Color(0xFFDDDDDD),
          ),
          GestureDetector(
            onTap: onFilterTap,
            child: const Row(
              children: [
                Icon(Icons.tune, size: 18, color: Color(0xFF1A1A1A)),
                SizedBox(width: 6),
                Text(
                  'Filter',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
