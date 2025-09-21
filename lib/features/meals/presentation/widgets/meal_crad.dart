import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/core/injection/injection_container.dart';
import 'package:one_studio_task/core/widgets/app_cached_network_image.dart';
import 'package:one_studio_task/core/widgets/app_shadow.dart';
import 'package:one_studio_task/core/widgets/custom_popup.dart';
import 'package:one_studio_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/presentation/screens/meal_details_screen.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/add_button.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/meal_price_display.dart';

class MealCrad extends StatelessWidget {
  final Meal meal;
  const MealCrad({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: AppShadow.boxShadow(
          color: AppColors.textColor.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 120.h,
            child: AppCachedNetworkImage(imageUrl: meal.imageUrl),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: TextStyles.textViewBold14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  meal.description,
                  style: TextStyles.textViewRegular12.copyWith(
                    color: AppColors.subTextColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Spacer(),
          BeBadge(
            offset: Offset(-25, 0),
            badge: AddMealButton(
              onTap: () {
                CustomPopup.appShowModalBottomSheet(
                  context: context,
                  builder: (ctx) => BlocProvider(
                    create: (context) => sl<CartCubit>(),
                    child: MealDetailsScreen(meal: meal),
                  ),
                );
              },
            ),
            child: Container(
              width: double.infinity,
              color: AppColors.scaffoldColor,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: MealPriceDisplay(meal: meal),
            ),
          ),
        ],
      ),
    );
  }
}
