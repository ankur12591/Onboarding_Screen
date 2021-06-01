import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/furniture_home/models/Categories.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;

  const Categories({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
