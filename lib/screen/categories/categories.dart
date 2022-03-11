import 'package:flutter/material.dart';
import 'category_item.dart';
import '../../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final categories = CategoryModel.fetchAll();

  CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ..._getCategoryWidgets(),
        ]);
  }

  List<Widget> _getCategoryWidgets() {
    return categories
        .map((category) =>
            CategoryItem(category.id, category.title, category.color))
        .toList();
  }
}
