import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';
import 'package:one_studio_task/features/meals/domain/entities/option_value.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/checkbox_option_value_widget.dart';

class MultiOptionSection extends StatelessWidget {
  final MealOption option;
  final Function(List<OptionValue>?) onOptionSelected;

  const MultiOptionSection({
    super.key,
    required this.option,
    required this.onOptionSelected,
  });

  bool isSelected(OptionValue value) => option.multiSelectedOptionValues.contains(value);

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
          (index) => CheckboxOptionValueWidget(
            option: option,
            value: option.values[index],
            isSelected: isSelected(option.values[index]),
            onTap: () {
              OptionValue value = option.values[index];
              isSelected(value) ? option.multiSelectedOptionValues.remove(value) : option.multiSelectedOptionValues.add(value);
              onOptionSelected(List<OptionValue>.from(option.multiSelectedOptionValues));
            },
          ),
        )
      ],
    );
  }
}
