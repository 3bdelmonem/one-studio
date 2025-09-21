import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopup {
  static void appShowModalBottomSheet({required BuildContext context, required Widget Function(BuildContext) builder}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      clipBehavior: Clip.hardEdge,
      useSafeArea: true,
      scrollControlDisabledMaxHeightRatio: 0.8,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      builder: builder,
    );
  }

  static void appShowDialog({required BuildContext context, required Widget Function(BuildContext) builder}) {
    showDialog(
      context: context,
      builder: builder,
    );
  }
}
