import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_constants.dart';
import 'package:trendify/core/theme/app_colors.dart';
import 'package:trendify/features/product/widgets/voucher_chip.dart';

class VoucherSection extends StatelessWidget {
  final List<VoucherItem> vouchers;

  const VoucherSection({super.key, required this.vouchers});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Vouchers Available',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'View All →',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: vouchers
                .map(
                  (v) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: VoucherChip(voucher: v),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
