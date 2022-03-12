import 'package:flutter/material.dart';
import 'screen/category_meals/category_meals.dart';
import 'screen/welcome/welcome.dart';
import 'screen/meal_detail/meal_detail.dart';
import 'screen/tabs/tabs.dart';
import 'screen/filters/filters.dart';
import 'routes.dart';
import 'models/meal.dart';

class MealApp extends StatefulWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<MealModel> _availableMeals = MealModel.fetchAll();
  List<MealModel> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = MealModel.fetchAll().where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(MealModel.fetchById(mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Main Meal App',
        theme: ThemeData(
            fontFamily: 'OpenSans',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline4: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
                .copyWith(secondary: Colors.amber[300])),
        onGenerateRoute: _routes(),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const WelcomeScreen());
        });
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case homeRoute:
          screen = const WelcomeScreen();
          break;
        case categoriesRoute:
          screen = TabScreen(_favoriteMeals);
          break;
        case categoryMealsRoute:
          var args = settings.arguments as Map;
          screen =
              CategoryMealsScreen(_availableMeals, args['id'], args['title']);
          break;
        case mealDetailRoute:
          var args = settings.arguments as Map;
          screen =
              MealDetailScreen(args['id'], _toggleFavorite, _isMealFavorite);
          break;
        case filtersRoute:
          screen = FiltersScreen(_filters, _setFilters);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
