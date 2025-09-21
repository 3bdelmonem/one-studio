import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/toast/app_toast.dart';
import 'package:one_studio_task/core/widgets/app_appbar.dart';
import 'package:one_studio_task/core/widgets/app_empty_widget.dart';
import 'package:one_studio_task/core/widgets/custom_animation_loading.dart';
import 'package:one_studio_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:one_studio_task/features/cart/presentation/widgets/cart_card.dart';
import 'package:one_studio_task/features/meals/presentation/widgets/add_to_cart_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppAppbar(
          title: 'Cart Screen',
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) => current is GetCartLoaded,
        builder: (context, state) {
          if (state is GetCartLoaded && state.cart.meals.isNotEmpty) {
            return CartButton(
              text: 'Checkout',
              totalPrice: state.cart.meals.fold(0, (sum, meal) => sum + (meal.totalPrice??0)),
            ); 
          }
          return SizedBox();
        },
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is GetCartError) {
            appToast(context: context, type: ToastType.error, message: state.message);
          } else if (state is UpdateCartItemError) {
            appToast(context: context, type: ToastType.error, message: state.message);
          } else if (state is RemoveFromCartError) {
            appToast(context: context, type: ToastType.error, message: state.message);
          } else if (state is DeleteCartError) {
            appToast(context: context, type: ToastType.error, message: state.message);
          } else if (state is UpdateCartItemSuccess) {
            context.read<CartCubit>().getCart();
            appToast(context: context, type: ToastType.success, message: state.message);
          } else if (state is RemoveFromCartSuccess) {
            context.read<CartCubit>().getCart();
            appToast(context: context, type: ToastType.success, message: state.message);
          }
        },
        buildWhen: (previous, current) => current is GetCartLoaded,
        builder: (context, state) {
          if (state is GetCartLoaded) {
            if (state.cart.meals.isEmpty) {
              return AppEmptyWidget(message: 'No meals in cart');
            }
            return ListView.separated(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 25.h),
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
              itemCount: state.cart.meals.length,
              itemBuilder: (context, index) => CartCard(meal: state.cart.meals[index], index: index),
            );
          }
          return CustomAnimationLoading();
        },
      ),
    );
  }
}