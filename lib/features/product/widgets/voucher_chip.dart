import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_constants.dart';
import 'package:trendify/core/theme/app_colors.dart';

class VoucherChip extends StatelessWidget {
  final VoucherItem voucher;

  const VoucherChip({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ColoredBox(
      color: AppColors.greyBg,
      child: Row(
        children: [
          _DiscountTab(label: voucher.label, discount: voucher.discount),
          _VoucherInfo(
            code: voucher.code,
            minSpend: voucher.minSpend,
            until: voucher.until,
          ),
        ],
      ),
      ),
    );
  }
}

class _DiscountTab extends StatelessWidget {
  final String label;
  final String discount;

  const _DiscountTab({required this.label, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: AppColors.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            discount,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _VoucherInfo extends StatelessWidget {
  final String code;
  final String minSpend;
  final String until;

  const _VoucherInfo({
    required this.code,
    required this.minSpend,
    required this.until,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            code,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
          Text(
            'Min. spend $minSpend',
            style: const TextStyle(fontSize: 10, color: Color(0xFF888888)),
          ),
          Text(
            'Until $until',
            style: const TextStyle(fontSize: 10, color: Color(0xFF888888)),
          ),
        ],
      ),
    );
  }
}
