import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_constants.dart';
import 'package:trendify/features/home/widgets/product_card.dart';
import 'package:trendify/features/home/widgets/section_header.dart';
import 'package:trendify/features/product/widgets/color_selector.dart';
import 'package:trendify/features/product/widgets/product_bottom_bar.dart';
import 'package:trendify/features/product/widgets/product_detail_header.dart';
import 'package:trendify/features/product/widgets/product_detail_image.dart';
import 'package:trendify/features/product/widgets/product_info_section.dart';
import 'package:trendify/features/product/widgets/rating_section.dart';
import 'package:trendify/features/product/widgets/size_selector.dart';
import 'package:trendify/features/product/widgets/voucher_section.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedSizeIndex = 3;
  int _selectedColorIndex = 0;
  bool _isWishlisted = false;

  static const _starDistribution = [0.72, 0.15, 0.07, 0.04, 0.02];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildScrollContent(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ProductBottomBar(
              isWishlisted: _isWishlisted,
              onWishlistTap: () =>
                  setState(() => _isWishlisted = !_isWishlisted),
              onBuyNow: () {},
              onAddToCart: () {},
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
        ),
      ),
      title: const Text(
        'Product',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1A1A1A),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined, color: Color(0xFF1A1A1A)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Color(0xFF1A1A1A)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildScrollContent() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 100),
      children: [
        const ProductDetailImage(image: 'assets/images/image_1.png'),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductDetailHeader(
                title: 'Urban Blend Long Sleeve Shirt',
                price: 185.00,
                originalPrice: 275,
                soldCount: 2475,
                rating: 4.8,
              ),
              const _Divider(),
              VoucherSection(vouchers: AppConstants.productVouchers),
              const _Divider(),
              SizeSelector(
                sizes: AppConstants.productSizes,
                selectedIndex: _selectedSizeIndex,
                onSelected: (i) => setState(() => _selectedSizeIndex = i),
              ),
              const SizedBox(height: 20),
              ColorSelector(
                colors: AppConstants.productColors,
                selectedIndex: _selectedColorIndex,
                onSelected: (i) => setState(() => _selectedColorIndex = i),
              ),
              const _Divider(),
              ProductInfoSection(
                items: AppConstants.productDetailInfo,
                description: AppConstants.productDescription,
              ),
              const _Divider(),
              RatingSection(
                rating: 4.8,
                totalRatings: 1228,
                totalReviews: 90,
                starDistribution: _starDistribution,
                reviews: AppConstants.productReviews,
              ),
              const _Divider(),
              SectionHeader(title: 'You May Also Like', onViewAll: () {}),
              const SizedBox(height: 12),
            ],
          ),
        ),
        _buildYouMayAlsoLike(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildYouMayAlsoLike() {
    return SizedBox(
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
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(color: Color(0xFFF0F0F0)),
    );
  }
}
