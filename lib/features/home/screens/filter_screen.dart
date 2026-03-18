import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../features/home/widgets/section_header.dart';
import '../widgets/filter_chip_item.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Categories
  final List<String> _categories = [
    'Women',
    'Men',
    'Shoe',
    'Bag',
    'Luxury',
    'Kids',
    'Sports',
    'Beauty',
    'Lifestyle',
    'Other',
  ];
  final Set<String> _selectedCategories = {'Men'};

  // Price range slider
  RangeValues _priceRange = const RangeValues(85, 220);
  String? _selectedPriceChip;

  // Rating
  String? _selectedRating;

  // Size
  String? _selectedSize = 'L';

  // Color
  String? _selectedColor = 'Black';

  void _reset() {
    setState(() {
      _selectedCategories.clear();
      _priceRange = const RangeValues(85, 220);
      _selectedPriceChip = null;
      _selectedRating = null;
      _selectedSize = null;
      _selectedColor = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.close, color: Color(0xFF1A1A1A)),
        ),
        title: const Text(
          'Filter',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        children: [
          // Categories
          SectionHeader(
            title: 'Categories',
            onViewAll: () {},
            actionLabel: 'See All',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                _categories.map((cat) {
                  return FilterChipItem(
                    label: cat,
                    isSelected: _selectedCategories.contains(cat),
                    onTap:
                        () => setState(() {
                          _selectedCategories.contains(cat)
                              ? _selectedCategories.remove(cat)
                              : _selectedCategories.add(cat);
                        }),
                  );
                }).toList(),
          ),

          const SizedBox(height: 24),

          // Price
          const SectionHeader(title: 'Price'),
          const SizedBox(height: 16),

          // Range slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: const Color(0xFFEEEEEE),
              thumbColor: AppColors.primary,
              overlayColor: AppColors.primary.withOpacity(0.1),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                enabledThumbRadius: 10,
              ),
              showValueIndicator: ShowValueIndicator.always,
              valueIndicatorColor: AppColors.primary,
              valueIndicatorTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            child: RangeSlider(
              values: _priceRange,
              min: 0,
              max: 500,
              labels: RangeLabels(
                '\$${_priceRange.start.round()}',
                '\$${_priceRange.end.round()}',
              ),
              onChanged:
                  (values) => setState(() {
                    _priceRange = values;
                    _selectedPriceChip = null;
                  }),
            ),
          ),

          const SizedBox(height: 12),

          // Price chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                AppConstants.filterPriceRanges.map((range) {
                  return FilterChipItem(
                    label: range,
                    isSelected: _selectedPriceChip == range,
                    onTap:
                        () => setState(
                          () =>
                              _selectedPriceChip =
                                  _selectedPriceChip == range ? null : range,
                        ),
                  );
                }).toList(),
          ),

          const SizedBox(height: 24),

          // Rating
          const SectionHeader(title: 'Rating'),
          const SizedBox(height: 12),
          Row(
            children:
                AppConstants.filterRatings.map((r) {
                  final isSelected = _selectedRating == r;
                  return GestureDetector(
                    onTap:
                        () => setState(
                          () => _selectedRating = isSelected ? null : r,
                        ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : const Color(0xFFDDDDDD),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color:
                                isSelected
                                    ? Colors.white
                                    : const Color(0xFFFFA800),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            r,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  isSelected
                                      ? Colors.white
                                      : const Color(0xFF555555),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),

          const SizedBox(height: 24),

          // Size
          SectionHeader(
            title: 'Size',
            onViewAll: () {},
            actionLabel: 'See All',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                AppConstants.filterSizes.map((size) {
                  final isSelected = _selectedSize == size;
                  return GestureDetector(
                    onTap:
                        () => setState(
                          () => _selectedSize = isSelected ? null : size,
                        ),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : const Color(0xFFDDDDDD),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        size,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color:
                              isSelected
                                  ? Colors.white
                                  : const Color(0xFF333333),
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),

          const SizedBox(height: 24),

          // Color
          SectionHeader(
            title: 'Color',
            onViewAll: () {},
            actionLabel: 'See All',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children:
                AppConstants.filterColors.map((colorMap) {
                  final label = colorMap['label'] as String;
                  final color = colorMap['color'] as Color;
                  final isSelected = _selectedColor == label;
                  return GestureDetector(
                    onTap:
                        () => setState(
                          () => _selectedColor = isSelected ? null : label,
                        ),
                    child: Column(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFEEEEEE)),
                          ),
                          child:
                              isSelected
                                  ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                  : null,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF555555),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),

      // Bottom buttons
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _reset,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Color(0xFFDDDDDD)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
