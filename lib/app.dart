import 'package:flutter/material.dart';
import 'screen/category_meals/category_meals.dart';
import 'screen/welcome/welcome.dart';
import 'screen/meal_detail/meal_detail.dart';
import 'screen/tabs/tabs.dart';
import 'routes.dart';

class MealApp extends StatelessWidget {
  const MealApp({Key? key}) : super(key: key);

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
          screen = const TabScreen();
          break;
        case categoryMealsRoute:
          var args = settings.arguments as Map;
          screen = CategoryMealsScreen(args['id'], args['title']);
          break;
        case mealDetail:
          var args = settings.arguments as Map;
          screen = MealDetailScreen(args['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
