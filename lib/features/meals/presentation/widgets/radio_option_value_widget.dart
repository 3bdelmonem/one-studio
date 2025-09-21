import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/core/widgets/circle_container.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';
import 'package:one_studio_task/features/meals/domain/entities/option_value.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/select_card.dart';

class RadioOptionValueWidget extends StatelessWidget {
  final MealOption option;
  final OptionValue value;
  final bool isSelected;
  final VoidCallback onTap;

  const RadioOptionValueWidget({
    super.key,
    required this.option,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SelectCard(
      onTap: onTap,
      child: Row(
        spacing: 10.w,
        children: [
          Expanded(child: Text(value.name, style: TextStyles.textViewRegular14,),),
          Text('${value.price.toStringAsFixed(2)} \$', style: TextStyles.textViewBold14,),
          CircleContainer(
            size: 22,
            border: Border.all(color: AppColors.primary, width: 1.5.r),
            child: isSelected ? CircleContainer(size: 14, color: AppColors.primary,) : null,
          ),
        ],
      ),
    );
  }
}
