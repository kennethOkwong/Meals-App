import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/provider/favourite_meals_provider.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/custom_drawer.dart';

const kInitialFilters = {
  'gluten_free': false,
  'lactose_free': false,
  'vegetarian': false,
  'vegan': false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  String title = '';
  Widget _selectScreen() {
    if (_selectedIndex == 0) {
      title = 'Categories';
      return const CategoryScreen();
    } else {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      return MealsScreen(
        meals: favouriteMeals,
      );
    }
  }

  var _selectedIndex = 0;
  _selectTab(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  selectDrawerItem(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: CustomDrawer(
        onSelectedItem: (identifier) {
          selectDrawerItem(identifier);
        },
      ),
      body: _selectScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _selectTab(value);
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
