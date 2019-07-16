import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // 他画面からデータ受取り
  final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes For The Category!'),
      ),
    );
  }
}
