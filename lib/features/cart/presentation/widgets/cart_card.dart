import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/core/widgets/app_cached_network_image.dart';
import 'package:one_studio_task/core/widgets/app_shadow.dart';
import 'package:one_studio_task/core/widgets/circle_container.dart';
import 'package:one_studio_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:one_studio_task/features/cart/presentation/widgets/cart_quantity_selector.dart';
import 'package:one_studio_task/features/cart/presentation/widgets/cart_selected_meal_options.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/presentation/utils/meal_calculations.dart';

class CartCard extends StatelessWidget {
  final Meal meal;
  final int index;
  const CartCard({super.key, required this.meal, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: AppShadow.boxShadow(),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Stack(
            children: [
              Container(
                width: 140.w,
                height: 145.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: AppCachedNetworkImage(imageUrl: meal.imageUrl),
              ),
              CircleContainer(
                onTap: () {context.read<CartCubit>().removeFromCart(meal: meal);},
                size: 30,
                margin: EdgeInsets.all(7.r),
                color: AppColors.red.withValues(alpha: 0.5),
                child: Icon(Icons.delete_outline_rounded, color: AppColors.red,),
              )
            ],
          ),
          Expanded(
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meal.name, style: TextStyles.textViewBold14),
                ...List.generate(
                  MealCalculations.getSelectedOptions(meal).length,
                  (index) => CartSelectedMealOptions(mealOption: MealCalculations.getSelectedOptions(meal)[index]),
                ),
                Text('${(meal.totalPrice??0).toStringAsFixed(2)} \$', style: TextStyles.textViewBold14,),
              ],
            ),
          ),
          CartQuantitySelector(
            quantity: meal.quantity,
            onDecrease: () {
              if (meal.quantity > 1) {
                int q = meal.quantity - 1;
                double t = ((meal.totalPrice??0)/meal.quantity) * q;
                context.read<CartCubit>().updateCartItem(
                  meal: meal.copyWith(quantity: q, totalPrice: t),
                  index: index,
                );
              }
            },
            onIncrease: () {
              int q = meal.quantity + 1;
              double t = ((meal.totalPrice??0)/meal.quantity) * q;
              context.read<CartCubit>().updateCartItem(
                meal: meal.copyWith(quantity: q, totalPrice: t),
                index: index,
              );}, basePrice: meal.price
          )
        ],
      ),
    );
  }
}