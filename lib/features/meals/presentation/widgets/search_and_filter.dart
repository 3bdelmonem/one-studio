import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_icons.dart';
import 'package:one_studio_task/core/widgets/app_icon_button.dart';
import 'package:one_studio_task/core/widgets/app_shadow.dart';
import 'package:one_studio_task/core/widgets/search_formfield.dart';

class SearchAndFilter extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onTapFilter;
  final Function(String)? onSearchChanged;
  final Function()? onSearchDelete;
  const SearchAndFilter({super.key, required this.controller, this.onTapFilter, this.onSearchChanged, this.onSearchDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Row(
        spacing: 10.w,
        children: [
          Expanded(
            child: SearchFormField(
              controller: controller,
              hintText: 'Search for a meal',
              onChanged: onSearchChanged,
              onDelete: onSearchDelete,
            )
          ),
          AppIconButton(
            onTap: onTapFilter,
            child: Container(
              width: 45.w,
              height: 45.h,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.scaffoldColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: AppShadow.boxShadow()
              ),
              child: AppIcons.icon(icon: AppIcons.filter)
            ),
          )
        ],
      )
    );
  }
}