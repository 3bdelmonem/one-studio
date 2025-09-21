import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';
import 'package:one_studio_task/features/meals/domain/entities/option_value.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/radio_option_value_widget.dart';

class SingleOptionSection extends StatelessWidget {
  final MealOption option;
  final Function(OptionValue?) onOptionSelected;

  const SingleOptionSection({
    super.key,
    required this.option,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${option.name}:', style: TextStyles.textViewBold16,),
            if (option.isRequired)
            Text('(required)', style: TextStyles.textViewRegular12.copyWith(color: AppColors.subTextColor,),),
          ],
        ),
        ...List.generate(
          option.values.length,
          (index) => RadioOptionValueWidget(
            option: option,
            value: option.values[index],
            isSelected: option.singleSelectedOptionValue == option.values[index],
            onTap: () {
              onOptionSelected(option.singleSelectedOptionValue == option.values[index] ? null : option.values[index]);
            },
          ),
        ),
      ],
    );
  }
}
