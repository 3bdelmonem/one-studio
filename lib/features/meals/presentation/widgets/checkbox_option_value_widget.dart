import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_icons.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';
import 'package:one_studio_task/features/meals/domain/entities/option_value.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/select_card.dart';

class CheckboxOptionValueWidget extends StatelessWidget {
  final MealOption option;
  final OptionValue value;
  final bool isSelected;
  final VoidCallback onTap;

  const CheckboxOptionValueWidget({
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
          Expanded(
            child: Text(
              value.name,
              style: TextStyles.textViewRegular14,
            ),
          ),
          Text(
            '${value.price.toStringAsFixed(2)} \$',
            style: TextStyles.textViewBold14,
          ),
          AnimatedContainer(
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 22.w,
            height: 22.h,
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              color: AppColors.scaffoldColor,
              border: Border.all(color: AppColors.primary, width: 1.5.r),
            ),
            child: isSelected ? AppIcons.icon(icon: AppIcons.right, color: AppColors.primary,) : null,
          )
        ],
      ),
    );


    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     margin: EdgeInsets.only(bottom: 8.h),
    //     padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
    //     decoration: BoxDecoration(
    //       color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.cardColor,
    //       borderRadius: BorderRadius.circular(10.r),
    //       border: Border.all(
    //         color: isSelected ? AppColors.primary : AppColors.hintColor.withValues(alpha: 0.3),
    //         width: 1,
    //       ),
    //     ),
    //     child: Row(
    //       children: [
    //         // Selection Indicator
    //         Container(
    //           width: 20.w,
    //           height: 20.h,
    //           decoration: BoxDecoration(
    //             shape: option.isSingle ? BoxShape.circle : BoxShape.rectangle,
    //             borderRadius: option.isSingle ? null : BorderRadius.circular(4.r),
    //             color: isSelected ? AppColors.primary : Colors.transparent,
    //             border: Border.all(
    //               color: isSelected ? AppColors.primary : AppColors.hintColor,
    //               width: 2,
    //             ),
    //           ),
    //           child: isSelected
    //               ? Icon(
    //                   option.isSingle ? Icons.circle : Icons.check,
    //                   color: Colors.white,
    //                   size: 12.r,
    //                 )
    //               : null,
    //         ),
            
    //         SizedBox(width: 12.w),
            
    //         // Option Name
        //     Expanded(
        //       child: Text(
        //         value.name,
        //         style: TextStyles.textViewRegular14,
        //       ),
        //     ),
            
        //     // Price
        //     Text(
        //       '${value.price.toStringAsFixed(2)} \$',
        //       style: TextStyles.textViewBold14,
        //     ),
        //   ],
        // ),
    //   ),
    // );
  }
}
