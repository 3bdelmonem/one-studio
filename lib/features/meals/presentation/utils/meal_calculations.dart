import 'package:one_studio_task/features/meals/domain/entities/meal.dart';
import 'package:one_studio_task/features/meals/domain/entities/meal_option.dart';

class MealCalculations {
  static double calculateTotalPrice({required Meal meal, required int quantity, required List<MealOption> mealOptions,}) {
    double total = meal.price * quantity;
    
    for (var option in mealOptions) {
      if (option.isSingle) {
        if (option.singleSelectedOptionValue != null) {
          if (option.isPriceDetermining) {
            total = option.singleSelectedOptionValue!.price * quantity;
          } else {
            total += option.singleSelectedOptionValue!.price * quantity;
          }
        }
      } else {
        if (option.multiSelectedOptionValues.isNotEmpty) {
          for (var selectedValue in option.multiSelectedOptionValues) {
            if (option.isPriceDetermining) {
              total = selectedValue.price * quantity;
            } else {
              total += selectedValue.price * quantity;
            }
          }
        }
      }
    }
    
    return total;
  }

  static bool areAllRequiredOptionsSelected(List<MealOption> mealOptions) {
    for (var option in mealOptions) {
      if (option.isRequired) {
        if (option.isSingle) {
          if (option.singleSelectedOptionValue == null) {
            return false;
          }
        } else {
          if (option.multiSelectedOptionValues.isEmpty) {
            return false;
          }
        }
      }
    }
    return true;
  }



  static List<MealOption> getSelectedOptions(Meal meal) {
    return meal.options.where((element) => element.multiSelectedOptionValues.isNotEmpty || element.singleSelectedOptionValue != null).toList();
  }
}
