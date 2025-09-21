import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/widgets/app_shimmer.dart';
import 'package:one_studio_task/core/widgets/shimmer_shape.dart';

class MealLoading extends StatelessWidget {
  const MealLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7, mainAxisSpacing: 15.h, crossAxisSpacing: 10.w,),
      itemCount: 20,
      itemBuilder: (context, index) => AppShimmer(child: ShimmerShape(radius: 15.r))
    );
  }
}