import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<MealModel> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          complexityText: favoriteMeals[index].complexityText,
          duration: favoriteMeals[index].duration,
          affordabilityText: favoriteMeals[index].affordabilityText,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
