import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/font_utils.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';

class MealPriceDisplay extends StatelessWidget {
  final Meal meal;
  const MealPriceDisplay({super.key, required this.meal,});

  bool get hasPriceDeterminingOptions => meal.options.any((option) => option.isPriceDetermining);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        Text(
          hasPriceDeterminingOptions ? 'Price upon selection' : '${meal.price.toStringAsFixed(2)} \$',
          style: TextStyles.textViewBold12.copyWith(color: AppColors.primary, fontFamily: AppFont.secondaryFontFamily),
        ),
        if (!hasPriceDeterminingOptions && meal.priceBeforeDiscount != null && meal.priceBeforeDiscount! > meal.price)
        Text(
          '${meal.priceBeforeDiscount!.toStringAsFixed(0)} \$',
          style: TextStyles.textViewBold12.copyWith(color: AppColors.subTextColor, decoration: TextDecoration.lineThrough,),
        ),
      ],
    );
  }
}