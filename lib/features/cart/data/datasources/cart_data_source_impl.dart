import 'package:one_studio_task/core/storage/data/storage.dart';
import 'package:one_studio_task/features/cart/data/models/cart_model.dart';
import 'package:one_studio_task/features/meals/data/models/meal_model.dart';
import 'cart_data_source.dart';

class CartDataSourceImpl implements CartDataSource {
  final Storage storage;
  CartDataSourceImpl({required this.storage});

  @override
  Future<CartModel> getCart() async {
    CartModel cart = storage.getCart() ?? CartModel(meals: []);
    return cart;
  }

  @override
  Future<String> addToCart(MealModel meal) async {
    CartModel cart = await getCart();
    if (cart.meals.contains(meal)) {
      final index = cart.meals.indexOf(meal);
      cart.meals[index] = cart.meals[index].copyWith(
        quantity: cart.meals[index].quantity + meal.quantity,
        totalPrice: (cart.meals[index].totalPrice??0) + (meal.totalPrice??0),
      );
    } else {
      cart.meals.add(meal);
    }
    storage.updateCart(cart: cart);
    return 'Cart updated successfully';
  }


  @override
  Future<String> updateCartItem(MealModel meal, int index) async {
    CartModel cart = await getCart();
    cart.meals[index] = meal;
    storage.updateCart(cart: cart);
    return 'Cart updated successfully';
  }

  @override
  Future<String> removeFromCart(MealModel meal) async {
    CartModel cart = await getCart();
    cart.meals.remove(meal);
    storage.updateCart(cart: cart);
    return 'Cart updated successfully';
  }

  @override
  Future<String> deleteCart() async {
    storage.deleteCart();
    return 'Cart deleted successfully';
  }
}