import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmptyWidget extends StatelessWidget {
  final String message;  
  const AppEmptyWidget({required this.message, super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("👾", style: TextStyles.textViewSemiBold27.copyWith(fontSize: 75.sp),),
            Text(message, style: TextStyles.textViewBold20, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
} 