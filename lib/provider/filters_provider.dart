import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/provider/meals.dart';

class FiltersNotifier extends StateNotifier<Map<String, bool>> {
  FiltersNotifier()
      : super({
          'gluten_free': false,
          'lactose_free': false,
          'vegetarian': false,
          'vegan': false,
        });

  void setFilters(Map<String, bool> filters) {
    state = filters;
  }

  void setFilter(String key, bool value) {
    state = {
      ...state,
      key: value,
    };
  }
}

final filtersNotifierProviver =
    StateNotifierProvider<FiltersNotifier, Map<String, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filters = ref.watch(filtersNotifierProviver);
  final filteredMeals = meals.where(
    (meal) {
      if (filters['gluten_free']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose_free']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      return true;
    },
  ).toList();

  return filteredMeals;
});
