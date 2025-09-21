import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_images.dart';

class CustomAnimationLoading extends StatelessWidget {
  final Color? color;
  const CustomAnimationLoading({super.key, this.color});
  
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: color?? AppColors.transparent,
      child: Center(
        child: Image.asset(
          AppImages.logo,
          width: MediaQuery.sizeOf(context).width*0.4,
        ).animate(
          delay: 200.ms,
          onPlay: (controller) => controller.repeat(reverse: true)
        ).shimmer(duration: 1500.ms, color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}