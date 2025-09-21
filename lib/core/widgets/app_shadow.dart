import 'package:flutter/material.dart';
import 'package:one_studio_task/core/config/app_colors.dart';

class AppShadow {
  static List<BoxShadow> boxShadow({Color? color, Offset? offset, double? blurRadius, double? spreadRadius, BlurStyle? blurStyle,}) => [BoxShadow(
    offset: offset ?? Offset.zero,
    color: color ?? AppColors.textColor.withValues(alpha: 0.1),
    blurRadius: blurRadius ?? 15,
    spreadRadius: spreadRadius ?? 0,
    blurStyle: blurStyle ?? BlurStyle.normal,
  )];
}