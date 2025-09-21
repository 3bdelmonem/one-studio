import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_icons.dart';

class AddMealButton extends StatelessWidget {
  final Function()? onTap;
  const AddMealButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Container(
        width: 20.w,
        height: 20.h,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: AppIcons.icon(icon: AppIcons.plus, color: AppColors.scaffoldColor,),
      ),
    );
  }
}