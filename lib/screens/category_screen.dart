import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/dummy_data/category.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/grid_category_item.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({
    super.key,
  });

  void _onselectedCategory(
      BuildContext context, Category category, WidgetRef ref) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    final meals = filteredMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: meals,
        ),
      ),
    );
    // log(meals.length.toString());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in allCategories)
            GridCategoryItem(
              category: category,
              onSelectedCategory: () =>
                  _onselectedCategory(context, category, ref),
            )
        ],
      ),
    );
  }
}
