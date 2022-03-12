import 'package:flutter/material.dart';
import '../../models/meal.dart';
import 'meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryMealsScreen(this.categoryId, this.categoryTitle, {Key? key})
      : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<MealModel> displayedMeals;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    displayedMeals = MealModel.fetchAllByCategoryId(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                complexityText: displayedMeals[index].complexityText,
                duration: displayedMeals[index].duration,
                affordabilityText: displayedMeals[index].affordabilityText,
                removeItem: _removeMeal);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
