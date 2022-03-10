import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  const CategoryModel(
      {required this.id, required this.title, this.color = Colors.orange});

  static List<CategoryModel> fetchAll() {
    return const [
      CategoryModel(id: '1', title: 'Italian', color: Colors.purple),
      CategoryModel(id: '2', title: 'Quick & Easy', color: Colors.red),
      CategoryModel(id: '3', title: 'Hamburgers', color: Colors.yellow),
      CategoryModel(id: '4', title: 'German'),
      CategoryModel(id: '5', title: 'Light & Lovely', color: Colors.blueGrey),
      CategoryModel(
          id: '6', title: 'Exotic', color: Color.fromARGB(255, 99, 61, 236)),
      CategoryModel(
          id: '7',
          title: 'Breakfast',
          color: Color.fromARGB(255, 34, 151, 180)),
      CategoryModel(id: '8', title: 'Asian', color: Colors.lightGreen),
    ];
  }
}
