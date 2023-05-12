import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait(
      {super.key,
      required this.duration,
      required this.complexity,
      required this.affordability});

  final String duration;
  final String complexity;
  final String affordability;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Item(
          text: duration,
          icon: Icons.schedule,
        ),
        const SizedBox(
          width: 16,
        ),
        Item(
          text: complexity,
          icon: Icons.work,
        ),
        const SizedBox(
          width: 16,
        ),
        Item(
          text: affordability,
          icon: Icons.attach_money,
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
        ),
        Text(
          ' $text',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
