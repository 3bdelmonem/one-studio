import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/config/app_colors.dart';
import 'package:one_studio_task/core/config/app_icons.dart';
import 'package:one_studio_task/core/injection/injection_container.dart';
import 'package:one_studio_task/core/navigation/app_navigator.dart';
import 'package:one_studio_task/core/toast/app_toast.dart';
import 'package:one_studio_task/core/widgets/app_empty_widget.dart';
import 'package:one_studio_task/core/widgets/app_shadow.dart';
import 'package:one_studio_task/core/widgets/circle_container.dart';
import 'package:one_studio_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:one_studio_task/features/cart/presentation/screens/cart_screen.dart';
import 'package:one_studio_task/features/meals/presentation/cubit/meal_cubit.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/meal_crad.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/meal_loading.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/meals_sliver_appbar.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});
  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  void _onSearchSubmitted(String? value) {
    if (value != null && value.isNotEmpty) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 500), () {
        context.read<MealCubit>().searchMeals(query: value);
      });
    } else {
      context.read<MealCubit>().getMeals();
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<MealCubit>().getMeals();
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleContainer(
        onTap: () {sl<AppNavigator>().push(screen: BlocProvider(create: (context) => sl<CartCubit>(), child: CartScreen(),),);},
        size: 50,
        color: AppColors.scaffoldColor,
        boxShadow: AppShadow.boxShadow(),
        child: AppIcons.icon(icon: AppIcons.cart, size: 27),
      ),
      body: CustomScrollView(
        slivers: [
          MealsSliverAppbar(
            searchController: searchController,
            onSearchChanged: _onSearchSubmitted,
            onSearchDelete: context.read<MealCubit>().getMeals,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 10.h,
              bottom: 75.h,
            ),
            sliver: BlocConsumer<MealCubit, MealState>(
              listener: (context, state) {
                if (state is GetMealsError) {
                  appToast(
                    context: context,
                    type: ToastType.success,
                    message: state.message,
                  );
                }
              },
              builder: (context, state) {
                if (state is GetMealsLoaded) {
                  return SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: 10.w,
                    ),
                    itemCount: state.meals.length,
                    itemBuilder: (context, index) =>
                        MealCrad(meal: state.meals[index]),
                  );
                } else if (state is EmptySearchMeals) {
                  return SliverFillRemaining(
                    child: AppEmptyWidget(message: "No meals found"),
                  );
                }
                return MealLoading();
              },
            ),
          ),
        ],
      ),
    );
  }
}
