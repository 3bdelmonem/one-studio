import 'package:flutter/material.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';

class CartSelectedMealOptions extends StatelessWidget {
  final MealOption mealOption;
  const CartSelectedMealOptions({super.key, required this.mealOption});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text('${mealOption.name}: ', style: TextStyles.textViewSemiBold14,),
        if (mealOption.singleSelectedOptionValue != null)
        Text(mealOption.singleSelectedOptionValue?.name ?? '', style: TextStyles.textViewRegular12,),
        if (mealOption.multiSelectedOptionValues.isNotEmpty)
        Text(mealOption.multiSelectedOptionValues.map((e) => e.name).join(', '), style: TextStyles.textViewRegular12,),
      ],
    );
  }
}