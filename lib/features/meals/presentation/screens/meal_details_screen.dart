 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/styles/styles.dart';
import 'package:one_studio_task/core/injection/injection_container.dart';
import 'package:one_studio_task/core/navigation/app_navigator.dart';
import 'package:one_studio_task/core/toast/app_toast.dart';
import 'package:one_studio_task/core/widgets/app_cached_network_image.dart';
import 'package:one_studio_task/core/widgets/custom_loading.dart';
import 'package:one_studio_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/add_to_cart_button.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/quantity_selector.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/multi_option_section.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/single_option_section.dart';
import 'package:one_studio_task/features/meals/presentation/utils/meal_calculations.dart';

class MealDetailsScreen extends StatefulWidget {
  final Meal meal;
  const MealDetailsScreen({super.key, required this.meal});
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late Meal detailsMeal;

  @override
  void initState() {
    super.initState();
    detailsMeal = widget.meal;
  }

  double get totalPrice => MealCalculations.calculateTotalPrice(meal: detailsMeal, quantity: detailsMeal.quantity, mealOptions: detailsMeal.options,);
  bool get areAllRequiredOptionsSelected => MealCalculations.areAllRequiredOptionsSelected(detailsMeal.options);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddToCartSuccess) {
            appToast(context: context, type: ToastType.success, message: state.message);
            sl<AppNavigator>().pop();
          }
        },
        builder: (context, state) {
          if (state is AddToCartLoading) {return CustomLoading(top: 15.h, bottom: 25.h);}
          return CartButton(
            text: 'Add To Cart',
            totalPrice: totalPrice,
            isEnabled: totalPrice > 0 && areAllRequiredOptionsSelected,
            onTap: () {
              detailsMeal = detailsMeal.copyWith(totalPrice: totalPrice);
              context.read<CartCubit>().addToCart(meal: detailsMeal);  
            },
          );
        },
      ),
      appBar: AppBar(title: Text(widget.meal.name, style: TextStyles.textViewBold16,), leading: SizedBox(),),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w,  bottom: 25.h),
        child: Column(
          spacing: 15.h,
          children: [
            Container(
              width: double.infinity,
              height: 150.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: AppCachedNetworkImage(imageUrl: widget.meal.imageUrl),
            ),
            QuantitySelector(
              quantity: detailsMeal.quantity,
              basePrice: widget.meal.price,
              onDecrease: () {if (detailsMeal.quantity > 1) {setState(() {detailsMeal = detailsMeal.copyWith(quantity: detailsMeal.quantity - 1);});}},
              onIncrease: () {setState(() {detailsMeal = detailsMeal.copyWith(quantity: detailsMeal.quantity + 1);});},
            ),
            Column(
              spacing: 15.h,
              children: List.generate(
                detailsMeal.options.length,
                (index) => detailsMeal.options[index].isSingle ? SingleOptionSection(
                  option: detailsMeal.options[index],
                  onOptionSelected: (value) {setState(() {detailsMeal = detailsMeal.copyWith(options: detailsMeal.options.map((option) => option.id == detailsMeal.options[index].id ? option.copyWith(singleSelectedOptionValue: value) : option).toList());});},
                ) : MultiOptionSection(
                  option: detailsMeal.options[index],
                  onOptionSelected: (value) {setState(() {detailsMeal = detailsMeal.copyWith(options: detailsMeal.options.map((option) => option.id == detailsMeal.options[index].id ? option.copyWith(multiSelectedOptionValues: value) : option).toList());});},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}