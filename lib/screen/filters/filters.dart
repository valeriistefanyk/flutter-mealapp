import 'package:flutter/material.dart';
import '../tabs/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Your Filters')),
        drawer: const MainDrawer(),
        body: const Center(
          child: Text('Filters!'),
        ));
  }
}
