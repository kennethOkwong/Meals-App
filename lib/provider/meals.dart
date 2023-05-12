import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/dummy_data/meal.dart';

final mealsProvider = Provider((ref) {
  return allMeals;
});
