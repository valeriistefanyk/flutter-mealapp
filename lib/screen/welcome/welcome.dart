import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/image_banner.dart';
import '../../routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Intl.getCurrentLocale());
    print('WelcomeScreen: ${context.locale.toString()}');

    Devicelocale.currentLocale.then((value) => print("current locale: $value"));

    SharedPreferences.getInstance().then((value) => print(value.getKeys()));
    print('languageCode ${Locale(ui.window.locale.languageCode)}');
    print('localeOf: ${Localizations.localeOf(context)}');
    //context.setLocale(const Locale('uk'));
    print('languageCode ${Locale(ui.window.locale.languageCode)}');
    //print('WelcomeScreen 2: ${context.locale.toString()}');
    return Scaffold(
      appBar: AppBar(title: const Text('Meal App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            const ImageBanner('assets/images/welcome_img.png'),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Text(
                'app_title'.tr(),
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                'Browse recipes, add to favorites for quick access',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            )
          ]),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, categoriesRoute);
              },
              child: const Text('Continue'))
        ],
      ),
    );
  }
}
