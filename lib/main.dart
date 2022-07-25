import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: const MealApp(),
    supportedLocales: const [
      Locale('en'),
      Locale('ru'),
      Locale('uk'),
    ],
    fallbackLocale: const Locale('uk'),
    path: 'assets/translations',
  ));
}
