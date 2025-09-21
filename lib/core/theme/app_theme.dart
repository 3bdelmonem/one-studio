import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/font_utils.dart';
import 'package:one_studio_task/core/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    primaryColor: AppColors.primary,
    canvasColor: AppColors.cardColor,
    cardColor: AppColors.cardColor,
    disabledColor: AppColors.primary.withValues(alpha: 0.2),
    hintColor: AppColors.hintColor,
    dividerTheme: DividerThemeData(
      color: AppColors.hintColor,
      space: 20.h,
      thickness: 1.25.r,
    ),
    unselectedWidgetColor: AppColors.primary.withValues(alpha: 0.2),
    dividerColor: AppColors.hintColor,
    fontFamily: AppFont.fontFamily,
    pageTransitionsTheme: AppThemeData.pageTransitionsTheme,
    appBarTheme: AppThemeData.appBarTheme(
      texColor: AppColors.textColor,
      backgroundColor: AppColors.scaffoldColor,
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.cardColor,
      surface: AppColors.textColor,
      shadow: AppColors.hintColor,
      outline: AppColors.hintColor,
      onError: AppColors.red,
      onPrimary: AppColors.cardColor,
    ),
    inputDecorationTheme: AppThemeData.inputDecorationTheme(
      fillColor: AppColors.scaffoldColor,
      borderColor: AppColors.hintColor,
      hintColor: AppColors.hintColor,
      primaryColor: AppColors.primary,
      textColor: AppColors.textColor,
    ),
    elevatedButtonTheme: AppThemeData.elevatedButtonThemeData(
      primaryColor: AppColors.primary,
    ),
    checkboxTheme: AppThemeData.checkboxThemeData(
      primaryColor: AppColors.primary,
    ),
    iconTheme: IconThemeData(color: AppColors.hintColor, size: 25.r),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.cardColor,
      surfaceTintColor: AppColors.textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardColor,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.hintColor,
    ),
    tabBarTheme: AppThemeData.tabBarThemeData(
      primaryColor: AppColors.primary,
      borderColor: AppColors.hintColor,
    ),
    textTheme: AppThemeData.textTheme(textColor: AppColors.textColor),
    cardTheme: CardThemeData(
      elevation: 0.25,
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textColor,
    ),
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 2,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
    ),
  );
}
