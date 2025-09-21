import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/core/widgets/app_button.dart';

class CartButton extends StatelessWidget {
  final String text;
  final double totalPrice;
  final VoidCallback? onTap;
  final bool isEnabled;

  const CartButton({
    super.key,
    required this.text,
    required this.totalPrice,
    this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AppButton(
        onTap: isEnabled ? onTap : null,
        flexableHeight: true,
        color: isEnabled ? null : AppColors.primary.withValues(alpha: 0.25),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyles.textViewBold16.copyWith(color: Colors.white),
              ),
            ),
            Text(
               '${totalPrice.toStringAsFixed(2)} \$',
              style: TextStyles.textViewBold16.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
