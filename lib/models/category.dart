import 'package:flutter/material.dart';
import 'dummy_data.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  const CategoryModel(
      {required this.id, required this.title, this.color = Colors.orange});

  static List<CategoryModel> fetchAll() {
    return DUMMY_CATEGORIES;
  }
}
