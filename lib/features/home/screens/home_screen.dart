import 'package:flutter/material.dart';
import 'package:trendify/features/home/widgets/product_card.dart';
import 'package:trendify/features/home/widgets/promo_banner.dart';
import 'package:trendify/features/home/screens/search_screen.dart';
import 'package:trendify/features/home/widgets/section_header.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';

import 'category_grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(AppConstants.logoGreen, width: 32, height: 32),
        ),
        title: const Text(
          AppConstants.appName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF1A1A1A),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchScreen()),
                  ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Color(0xFFAAAAAA), size: 20),
                    SizedBox(width: 10),
                    Text(
                      'Search Trends...',
                      style: TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Promo banner
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: PromoBanner(),
          ),

          // Category filter
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: AppConstants.homeCategories.length,
              itemBuilder: (_, i) {
                final selected = i == _selectedCategoryIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategoryIndex = i),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color:
                            selected
                                ? AppColors.primary
                                : const Color(0xFFDDDDDD),
                      ),
                    ),
                    child: Text(
                      AppConstants.homeCategories[i],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color:
                            selected ? Colors.white : const Color(0xFF555555),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Category products (horizontal scroll)
          const SizedBox(height: 12),
          SizedBox(
            height: 255,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: AppConstants.featuredProducts.length,
              itemBuilder: (_, i) {
                final p = AppConstants.featuredProducts[i];
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

          // Category grid
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemCount: AppConstants.categoryGridItems.length,
              itemBuilder: (_, i) {
                final c = AppConstants.categoryGridItems[i];
                return CategoryGridItem(label: c.label, image: c.image);
              },
            ),
          ),

          // New Arrival
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: SectionHeader(title: 'New Arrival', onViewAll: () {}),
          ),
          SizedBox(
            height: 255,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              itemCount: AppConstants.newArrivalProducts.length,
              itemBuilder: (_, i) {
                final p = AppConstants.newArrivalProducts[i];
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

          // Hot Deals
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: SectionHeader(
              title: 'Hot Deals This Week',
              onViewAll: () {},
            ),
          ),
          SizedBox(
            height: 255,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
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
        ],
      ),
    );
  }
}
