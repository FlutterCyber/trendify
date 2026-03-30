import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'app_strings.dart';

class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'Trendify';

  // Assets
  static const String logoWhite = 'assets/images/logo.png';
  static const String logoGreen = 'assets/images/logo_green.png';

  // Splash
  static const int splashDurationMs = 3000;

  // Walkthrough
  static List<WalkthroughItem> get walkthroughItems => [
    WalkthroughItem(
      image: 'assets/images/walkthrough_1.png',
      title: AppStrings.walkthrough1Title.tr(),
      description: AppStrings.walkthrough1Description.tr(),
    ),
    WalkthroughItem(
      image: 'assets/images/walkthrough_2.png',
      title: AppStrings.walkthrough2Title.tr(),
      description: AppStrings.walkthrough2Description.tr(),
    ),
    WalkthroughItem(
      image: 'assets/images/walkthrough_3.png',
      title: AppStrings.walkthrough3Title.tr(),
      description: AppStrings.walkthrough3Description.tr(),
    ),
  ];

  // Home screen
  static List<String> get homeCategories => [
    AppStrings.homeCategoriesDiscover.tr(),
    AppStrings.homeCategoriesWomen.tr(),
    AppStrings.homeCategoriesMen.tr(),
    AppStrings.homeCategoriesShoe.tr(),
    AppStrings.homeCategoriesBag.tr(),
  ];

  // Sort options
  static List<String> get sortOptions => [
    AppStrings.homeSortMostSuitable.tr(),
    AppStrings.homeSortPopularity.tr(),
    AppStrings.homeSortTopRated.tr(),
    AppStrings.homeSortPriceHighToLow.tr(),
    AppStrings.homeSortPriceLowToHigh.tr(),
    AppStrings.homeSortLatestArrival.tr(),
    AppStrings.homeSortDiscount.tr(),
  ];

  static const List<ProductItem> featuredProducts = [
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Blend Long Sleeve', price: 185.00, rating: 4.8),
    ProductItem(image: 'assets/images/image_1.png', name: 'Luxe Blend Formal Shirt', price: 160.00, rating: 4.6),
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Flex Casual', price: 175.00, rating: 4.7),
  ];

  static const List<ProductItem> newArrivalProducts = [
    ProductItem(image: 'assets/images/image_1.png', name: 'Trend Craft Fleece', price: 210.00, rating: 4.9),
    ProductItem(image: 'assets/images/image_1.png', name: 'Moda Chic Luxury', price: 200.00, rating: 4.8),
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Elegance', price: 215.00, rating: 4.5),
  ];

  static const List<ProductItem> hotDealsProducts = [
    ProductItem(image: 'assets/images/image_1.png', name: 'Street Style Cozy Hoodie', price: 155.00, rating: 4.5),
    ProductItem(image: 'assets/images/image_1.png', name: 'Street Style Comfort', price: 155.00, rating: 4.7),
    ProductItem(image: 'assets/images/image_1.png', name: 'Vogue Fit Co.', price: 160.00, rating: 4.6),
  ];

  // Product detail screen
  static const List<String> productSizes = ['XS', 'S', 'M', 'L', 'XL'];

  static const List<Color> productColors = [
    Color(0xFF1A1A1A),
    Color(0xFFFFFFFF),
    Color(0xFF6D4C41),
    Color(0xFF607D8B),
    Color(0xFF3949AB),
    Color(0xFF6A1B9A),
  ];

  static List<ProductInfoItem> get productDetailInfo => [
    ProductInfoItem(label: AppStrings.productInfoMaterial.tr(), value: '100% Acrylic'),
    ProductInfoItem(label: AppStrings.productInfoCareLabel.tr(), value: 'Machine Washable'),
    ProductInfoItem(label: AppStrings.productInfoSku.tr(), value: 'URL-SS-CS-Cs-245'),
    ProductInfoItem(label: AppStrings.productInfoColor.tr(), value: 'Vary'),
    ProductInfoItem(label: AppStrings.productInfoNeck.tr(), value: 'High Neck'),
    ProductInfoItem(label: AppStrings.productInfoPattern.tr(), value: 'Solid'),
  ];

  static const String productDescription =
      'Elevate your style with the Urban Blend Long Sleeve Shirt, a perfect blend of urban sophistication and contemporary comfort. Crafted with meticulous attention to detail, this shirt is designed to make a statement in any setting.';

  static List<VoucherItem> get productVouchers => [
    VoucherItem(label: AppStrings.productVoucherBestDeal.tr(), discount: '20% OFF', code: 'DDEAL5', minSpend: '\$30', until: '01/01/2026'),
    VoucherItem(label: AppStrings.productVoucherBestDeal.tr(), discount: '10% OFF', code: 'HELLO', minSpend: '\$20', until: '01/01/2026'),
  ];

  static const List<ReviewItem> productReviews = [
    ReviewItem(
      name: 'Amelia Williams',
      time: '2 weeks ago',
      rating: 5,
      variant: 'Variant: L, Black',
      comment: 'Just arrived! Can\'t wait to try this week. Hope it suits my style 😍',
      hasImage: true,
    ),
    ReviewItem(
      name: 'Victoria Rodriguez',
      time: '6 days ago',
      rating: 4,
      variant: '',
      comment: 'Urban Blend shirt is a versatile addition. Slightly snug but stylish and well-made ❤️',
      hasImage: false,
    ),
  ];

  // Filter screen
  static const List<String> filterPriceRanges = [
    '\$1 - \$50',
    '\$51 - \$100',
    '\$101 - \$150',
    '\$151 - \$200',
    '\$201 - \$250',
    '\$251 - \$300',
    '\$300 & up',
  ];

  static List<String> get filterRatings => [
    AppStrings.filterRatings3Up.tr(),
    AppStrings.filterRatings4Up.tr(),
    AppStrings.filterRatings5.tr(),
  ];

  static const List<String> filterSizes = [
    'XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL',
    '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45',
  ];

  static List<Map<String, dynamic>> get filterColors => [
    {'label': AppStrings.filterColorsBlack.tr(), 'color': const Color(0xFF1A1A1A)},
    {'label': AppStrings.filterColorsWhite.tr(), 'color': const Color(0xFFFFFFFF)},
    {'label': AppStrings.filterColorsRed.tr(), 'color': const Color(0xFFE53935)},
    {'label': AppStrings.filterColorsPink.tr(), 'color': const Color(0xFFE91E8C)},
    {'label': AppStrings.filterColorsPurple.tr(), 'color': const Color(0xFF9C27B0)},
    {'label': AppStrings.filterColorsDeepPurple.tr(), 'color': const Color(0xFF6A1B9A)},
    {'label': AppStrings.filterColorsIndigo.tr(), 'color': const Color(0xFF3949AB)},
    {'label': AppStrings.filterColorsBlue.tr(), 'color': const Color(0xFF1E88E5)},
    {'label': AppStrings.filterColorsLightBlue.tr(), 'color': const Color(0xFF29B6F6)},
    {'label': AppStrings.filterColorsTeal.tr(), 'color': const Color(0xFF00897B)},
    {'label': AppStrings.filterColorsGreen.tr(), 'color': const Color(0xFF43A047)},
    {'label': AppStrings.filterColorsLime.tr(), 'color': const Color(0xFFCDDC39)},
    {'label': AppStrings.filterColorsYellow.tr(), 'color': const Color(0xFFFFEB3B)},
    {'label': AppStrings.filterColorsAmber.tr(), 'color': const Color(0xFFFFA000)},
    {'label': AppStrings.filterColorsOrange.tr(), 'color': const Color(0xFFFF7043)},
    {'label': AppStrings.filterColorsDeepOrange.tr(), 'color': const Color(0xFFBF360C)},
    {'label': AppStrings.filterColorsBrown.tr(), 'color': const Color(0xFF6D4C41)},
    {'label': AppStrings.filterColorsBlueGrey.tr(), 'color': const Color(0xFF607D8B)},
  ];

  static const List<ProductItem> categoryProducts = [
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Blend Long Sleeve', price: 185.00, rating: 4.8),
    ProductItem(image: 'assets/images/image_1.png', name: 'Elite Style Modal Eleg.', price: 190.00, rating: 4.9),
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Flex Comfort', price: 175.00, rating: 4.7),
    ProductItem(image: 'assets/images/image_1.png', name: 'Svelte Style Premium', price: 165.50, rating: 4.6),
    ProductItem(image: 'assets/images/image_1.png', name: 'Trend Craft Fleece', price: 210.00, rating: 4.7),
    ProductItem(image: 'assets/images/image_1.png', name: 'Moda Chic Luxury', price: 200.00, rating: 4.5),
  ];

  static List<CategoryItem> get categoryGridItems => [
    CategoryItem(label: AppStrings.categoryWomen.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryMen.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryShoe.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryBag.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryLuxury.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryKids.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categorySports.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryBeauty.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryLifestyle.tr(), image: 'assets/images/image_2.png'),
    CategoryItem(label: AppStrings.categoryOther.tr(), image: 'assets/images/image_2.png'),
  ];
}

class WalkthroughItem {
  final String image;
  final String title;
  final String description;

  const WalkthroughItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class ProductItem {
  final String image;
  final String name;
  final double price;
  final double rating;

  const ProductItem({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });
}

class CategoryItem {
  final String label;
  final String image;

  const CategoryItem({
    required this.label,
    required this.image,
  });
}

class ProductInfoItem {
  final String label;
  final String value;

  const ProductInfoItem({required this.label, required this.value});
}

class ReviewItem {
  final String name;
  final String time;
  final int rating;
  final String variant;
  final String comment;
  final bool hasImage;

  const ReviewItem({
    required this.name,
    required this.time,
    required this.rating,
    required this.variant,
    required this.comment,
    required this.hasImage,
  });
}

class VoucherItem {
  final String label;
  final String discount;
  final String code;
  final String minSpend;
  final String until;

  const VoucherItem({
    required this.label,
    required this.discount,
    required this.code,
    required this.minSpend,
    required this.until,
  });
}
