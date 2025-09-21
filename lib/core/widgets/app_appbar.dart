import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/core/injection/injection_container.dart';
import 'package:one_studio_task/core/navigation/app_navigator.dart';
import 'package:one_studio_task/core/widgets/app_shadow.dart';

class AppAppbar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final bool showMenuButton;
  final Function()? onBackTap;
  final Function()? onMenuTap;
  final Color? titleColor;
  final EdgeInsetsGeometry? padding;

  const AppAppbar({super.key, required this.title, this.titleColor, this.showBackButton = true, this.showMenuButton = true, this.onBackTap, this.onMenuTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showBackButton ? InkWell(
            onTap: onBackTap ?? sl<AppNavigator>().pop,
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            child: Container(
              width: 30.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.scaffoldColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: AppShadow.boxShadow(offset: Offset(0, 4)),
              ),
              child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textColor,),
            ),
          ) : SizedBox(),
          Text(title, style: TextStyles.textViewBold20.copyWith(color: titleColor),),
          showMenuButton? InkWell(
              onTap: onMenuTap,
              overlayColor: WidgetStatePropertyAll(AppColors.transparent),
              child: Container(
                width: 30.w,
                height: 30.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: AppShadow.boxShadow(offset: Offset(0, 4)),
                ),
                child: Icon(Icons.menu, color: AppColors.textColor,),
              ),
            ) : SizedBox(),
        
          ],
        ),
      ),
    );
  }
}