import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  const CategoryModel(
      {required this.id, required this.title, this.color = Colors.orange});

  static List<CategoryModel> fetchAll() {
    return const [
      CategoryModel(id: '1', title: 'Category 1', color: Colors.purple),
      CategoryModel(id: '2', title: 'Category 2', color: Colors.red),
      CategoryModel(id: '3', title: 'Category 3', color: Colors.yellow),
      CategoryModel(id: '4', title: 'Category 4'),
      CategoryModel(id: '5', title: 'Category 5', color: Colors.blueGrey),
      CategoryModel(id: '6', title: 'Category 6', color: Colors.green),
    ];
  }
}
