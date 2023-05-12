import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class GridCategoryItem extends StatelessWidget {
  const GridCategoryItem({
    super.key,
    required this.category,
    required this.onSelectedCategory,
  });

  final Category category;
  final VoidCallback onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectedCategory();
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
