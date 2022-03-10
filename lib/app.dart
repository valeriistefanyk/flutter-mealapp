import 'package:flutter/material.dart';
import 'package:meal_app/screen/categories/categories.dart';
import 'screen/welcome/welcome.dart';
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
        onGenerateRoute: _routes());
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case homeRoute:
          screen = const WelcomeScreen();
          break;
        case categoriesRoute:
          screen = CategoriesScreen();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
