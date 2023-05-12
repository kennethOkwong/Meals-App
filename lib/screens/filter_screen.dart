import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/widgets/filter_item.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersNotifierProviver);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            title: 'Gluten-free',
            subtitle: 'Only include gluten free meals',
            value: activeFilters['gluten_free']!,
            onSelected: (isChecked) {
              ref
                  .read(filtersNotifierProviver.notifier)
                  .setFilter('gluten_free', isChecked);
            },
          ),
          FilterItem(
            title: 'Lactose-free',
            subtitle: 'Only include lactose free meals',
            value: activeFilters['lactose_free']!,
            onSelected: (isChecked) {
              ref
                  .read(filtersNotifierProviver.notifier)
                  .setFilter('lactose_free', isChecked);
            },
          ),
          FilterItem(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: activeFilters['vegetarian']!,
            onSelected: (isChecked) {
              ref
                  .read(filtersNotifierProviver.notifier)
                  .setFilter('vegetarian', isChecked);
            },
          ),
          FilterItem(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: activeFilters['vegan']!,
            onSelected: (isChecked) {
              ref
                  .read(filtersNotifierProviver.notifier)
                  .setFilter('vegan', isChecked);
            },
          ),
        ],
      ),
    );
  }
}
