import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_images.dart';
import 'package:one_studio_task/core/widgets/app_appbar.dart';
import 'package:one_studio_task/core/widgets/app_cached_network_image.dart';
import 'package:one_studio_task/core/widgets/app_shadow.dart';
import 'package:one_studio_task/core/widgets/circle_container.dart';

class AppbarBackground extends StatelessWidget {
  const AppbarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return BeBadge(
      position: BeBadgePosition.bottomCenter,
      badge: CircleContainer(
        size: 110,
        boxShadow: AppShadow.boxShadow(color: AppColors.textColor.withValues(alpha: 0.2)),
        border: Border.all(color: AppColors.cardColor.withValues(alpha: 0.5), width: 15.r, strokeAlign: BorderSide.strokeAlignOutside),
        color: AppColors.scaffoldColor,
        noAlignment: true,
        child: AppCachedNetworkImage(imageUrl: AppImages.seaFoodDish),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.22,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        ),
        child: Stack(
          children: [
            SizedBox(width: double.infinity, height: double.infinity, child: AppCachedNetworkImage(imageUrl: AppImages.seaFood)),
            Container(color: AppColors.primary.withValues(alpha: 0.35),),
            AppAppbar(
              title: 'Sea Food',
              titleColor: AppColors.scaffoldColor,
              onBackTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}