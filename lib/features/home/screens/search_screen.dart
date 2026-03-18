import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/widgets/product_card.dart';
import '../../home/widgets/section_header.dart';
import '../widgets/camera_picker.dart';
import '../widgets/sort_bottom_sheet.dart';
import '../widgets/sort_filter_bar.dart';
import '../screens/filter_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _query = '';
  int _selectedCategoryIndex = 0;
  String _sortOption = AppConstants.sortOptions.first;

  final List<String> _recentSearches = ['Hoodie for Men', 'Nike', 'Polo Shirt'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _focusNode.requestFocus());
    _controller.addListener(() => setState(() => _query = _controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<ProductItem> get _results => AppConstants.featuredProducts
      .where((p) => p.name.toLowerCase().contains(_query.toLowerCase()))
      .toList();

  bool get _hasResults => _query.isNotEmpty && _results.isNotEmpty;

  void _openSort() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => SortBottomSheet(selectedOption: _sortOption),
    );
    if (result != null) setState(() => _sortOption = result);
  }

  void _openFilter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FilterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        decoration: const InputDecoration(
                          hintText: 'Search Trends...',
                          hintStyle: TextStyle(color: Color(0xFFAAAAAA), fontSize: 14),
                          prefixIcon: Icon(Icons.search, color: Color(0xFFAAAAAA), size: 20),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CameraPicker(),
                ],
              ),
            ),

            Expanded(
              child: _query.isEmpty
                  ? _buildRecentAndDeals()
                  : _hasResults
                  ? _buildResults()
                  : _buildNotFound(),
            ),
          ],
        ),
      ),

      // Sort + Filter floating bar — faqat natija bo'lganda ko'rinadi
      floatingActionButton: (_hasResults)
          ? SortFilterBar(onSortTap: _openSort, onFilterTap: _openFilter)
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildRecentAndDeals() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Searches',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            GestureDetector(
              onTap: () => setState(() => _recentSearches.clear()),
              child: const Icon(Icons.close, size: 20, color: Color(0xFF555555)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ..._recentSearches.map((s) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(s, style: const TextStyle(fontSize: 14, color: Color(0xFF333333))),
              GestureDetector(
                onTap: () => setState(() => _recentSearches.remove(s)),
                child: const Icon(Icons.close, size: 18, color: Color(0xFFAAAAAA)),
              ),
            ],
          ),
        )),
        const Divider(height: 24),
        SectionHeader(title: 'Hot Deals This Week', onViewAll: () {}),
        const SizedBox(height: 12),
        SizedBox(
          height: 255,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.hotDealsProducts.length,
            itemBuilder: (_, i) {
              final p = AppConstants.hotDealsProducts[i];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ProductCard(
                  image: p.image,
                  name: p.name,
                  price: p.price,
                  rating: p.rating,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildResults() {
    return Column(
      children: [
        // Category filter
        SizedBox(
          height: 44,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            itemCount: AppConstants.homeCategories.length,
            itemBuilder: (_, i) {
              final selected = i == _selectedCategoryIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedCategoryIndex = i),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: selected ? AppColors.primary : const Color(0xFFDDDDDD),
                    ),
                  ),
                  child: Text(
                    AppConstants.homeCategories[i],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : const Color(0xFF555555),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 80),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemCount: _results.length,
            itemBuilder: (_, i) {
              final p = _results[i];
              return ProductCard(
                image: p.image,
                name: p.name,
                price: p.price,
                rating: p.rating,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: -0.2,
                child: _ClipboardIcon(color: AppColors.primary.withOpacity(0.7)),
              ),
              const SizedBox(width: 8),
              _ClipboardIcon(color: AppColors.primary),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Trends Not Found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Did you accidentally mistype? Double-check your spelling and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF888888), height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClipboardIcon extends StatelessWidget {
  final Color color;
  const _ClipboardIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDDDDDD)),
      ),
      child: Column(
        children: [
          Container(
            height: 14,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}