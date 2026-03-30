import 'package:flutter/material.dart';
import 'package:trendify/core/theme/app_colors.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(
            colors.length,
            (i) => GestureDetector(
              onTap: () => onSelected(i),
              child: _ColorCircle(
                color: colors[i],
                isSelected: i == selectedIndex,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const _ColorCircle({required this.color, required this.isSelected});

  bool get _isWhite => color.toARGB32() == 0xFFFFFFFF;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppColors.primary
              : _isWhite
                  ? const Color(0xFFDDDDDD)
                  : Colors.transparent,
          width: isSelected ? 2.5 : 1,
        ),
      ),
      child: isSelected
          ? Icon(
              Icons.check,
              size: 16,
              color: _isWhite ? AppColors.primary : Colors.white,
            )
          : null,
    );
  }
}
