import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_icons.dart';
import 'package:one_studio_task/core/widgets/app_shadow.dart';
import 'package:one_studio_task/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_task/core/widgets/circle_container.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onDelete;
  final String? hintText;

  const SearchFormField({
    super.key,
    required this.controller,
    this.onDelete,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: AppShadow.boxShadow()),
      child: AppTextFormField(
        controller: controller,
        onChanged: onChanged,
        prefixIcon: AppIcons.search,
        hintText: hintText,
        suffixWidget: CircleContainer(
          onTap: () {
            controller.clear();
            FocusManager.instance.primaryFocus?.unfocus();
            onDelete?.call();
          },
          size: 20,
          color: AppColors.primary.withValues(alpha: 0.4),
          margin: EdgeInsets.all(8.r),
          padding: EdgeInsets.all(8.r),
          child: AppIcons.icon(icon: AppIcons.close, color: AppColors.primary),
        ),
      ),
    );
  }
}
