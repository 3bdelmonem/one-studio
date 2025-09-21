import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_icons.dart';

class QuantityButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      child: Container(
        width: 30.w,
        height: 30.h,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.15)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: AppIcons.icon(icon: icon, color: AppColors.scaffoldColor, ),
      ),
    );
  }
}
