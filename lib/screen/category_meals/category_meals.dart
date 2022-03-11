import 'package:flutter/material.dart';
import '../../models/meal.dart';
import 'meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryMealsScreen(this.categoryId, this.categoryTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryMeals = MealModel.fetchById(categoryId);

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                complexityText: categoryMeals[index].complexityText,
                duration: categoryMeals[index].duration,
                affordabilityText: categoryMeals[index].affordabilityText);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
