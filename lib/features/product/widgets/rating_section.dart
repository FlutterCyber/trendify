import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_constants.dart';
import 'package:trendify/features/home/widgets/section_header.dart';
import 'package:trendify/features/product/widgets/review_card.dart';

class RatingSection extends StatelessWidget {
  final double rating;
  final int totalRatings;
  final int totalReviews;
  final List<double> starDistribution;
  final List<ReviewItem> reviews;

  const RatingSection({
    super.key,
    required this.rating,
    required this.totalRatings,
    required this.totalReviews,
    required this.starDistribution,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Rating & Reviews', onViewAll: () {}),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RatingSummary(
              rating: rating,
              totalRatings: totalRatings,
              totalReviews: totalReviews,
            ),
            const SizedBox(width: 20),
            Expanded(child: _StarBars(distribution: starDistribution)),
          ],
        ),
        const SizedBox(height: 20),
        ...reviews.map((r) => ReviewCard(review: r)),
      ],
    );
  }
}

class _RatingSummary extends StatelessWidget {
  final double rating;
  final int totalRatings;
  final int totalReviews;

  const _RatingSummary({
    required this.rating,
    required this.totalRatings,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$rating',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
          ),
        ),
        Row(
          children: List.generate(
            5,
            (_) => const Icon(Icons.star, color: Color(0xFFFFA800), size: 16),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${_format(totalRatings)} rating · $totalReviews reviews',
          style: const TextStyle(fontSize: 11, color: Color(0xFF888888)),
        ),
      ],
    );
  }

  String _format(int n) => n
      .toString()
      .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');
}

class _StarBars extends StatelessWidget {
  final List<double> distribution;

  const _StarBars({required this.distribution});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Text(
                '${5 - i}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF888888),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: distribution[i],
                    backgroundColor: const Color(0xFFEEEEEE),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFFFFA800),
                    ),
                    minHeight: 6,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
