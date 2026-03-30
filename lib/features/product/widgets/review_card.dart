import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_constants.dart';
import 'package:trendify/core/theme/app_colors.dart';

class ReviewCard extends StatelessWidget {
  final ReviewItem review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ReviewHeader(review: review),
          const SizedBox(height: 8),
          _StarRow(rating: review.rating, variant: review.variant),
          const SizedBox(height: 6),
          Text(
            review.comment,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF555555),
              height: 1.5,
            ),
          ),
          if (review.hasImage) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/image_1.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ReviewHeader extends StatelessWidget {
  final ReviewItem review;

  const _ReviewHeader({required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.greyBg,
          child: Text(
            review.name[0],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Text(
                review.time,
                style: const TextStyle(fontSize: 12, color: Color(0xFF888888)),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Color(0xFF888888), size: 20),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _StarRow extends StatelessWidget {
  final int rating;
  final String variant;

  const _StarRow({required this.rating, required this.variant});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (i) => Icon(
              Icons.star,
              color: i < rating
                  ? const Color(0xFFFFA800)
                  : const Color(0xFFDDDDDD),
              size: 14,
            ),
          ),
        ),
        if (variant.isNotEmpty) ...[
          const SizedBox(width: 8),
          Text(
            variant,
            style: const TextStyle(fontSize: 12, color: Color(0xFF888888)),
          ),
        ],
      ],
    );
  }
}
