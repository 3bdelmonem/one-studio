import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_icons.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/quantity_button.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final double basePrice;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
    required this.basePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15.w,
            children: [
              QuantityButton(
                icon: AppIcons.minus,
                onTap: onDecrease,
              ),
              Text(
                quantity.toString(),
                style: TextStyles.textViewBold16,
              ),
              QuantityButton(
                icon: AppIcons.add,
                onTap: onIncrease,
              ),
            ],
          ),
          Spacer(),
          if (basePrice > 0)
          Text('${basePrice.toStringAsFixed(2)} \$', style: TextStyles.textViewBold16,),
        ],
      ),
    );
  }
}
