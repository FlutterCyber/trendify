import 'package:flutter/material.dart';
import 'package:trendify/core/theme/app_colors.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(
            sizes.length,
            (i) => GestureDetector(
              onTap: () => onSelected(i),
              child: _SizeButton(label: sizes[i], isSelected: i == selectedIndex),
            ),
          ),
        ),
      ],
    );
  }
}

class _SizeButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _SizeButton({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 48,
      height: 36,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? AppColors.primary : const Color(0xFFDDDDDD),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : const Color(0xFF555555),
        ),
      ),
    );
  }
}
