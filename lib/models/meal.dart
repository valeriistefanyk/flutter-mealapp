import 'dummy_data.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class MealModel {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';
      case Complexity.challenging:
        return 'challenging';
      case Complexity.hard:
        return 'hard';
      default:
        return 'unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';
      case Affordability.pricey:
        return 'pricey';
      case Affordability.luxurious:
        return 'luxurious';
      default:
        return 'unknown';
    }
  }

  static List<MealModel> fetchAll() {
    return DUMMY_MEALS;
  }

  static List<MealModel> fetchAllByCategoryId(String categoryId) {
    return fetchAll()
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  static MealModel fetchById(String id) {
    return fetchAll().firstWhere((meal) => meal.id == id);
  }
}
