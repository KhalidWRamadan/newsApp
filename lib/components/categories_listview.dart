import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/category_item.dart';
import 'package:news_app_ui_setup/models/category_model.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = [
    CategoryModel(categoryName: 'Business', image: 'assets/business.avif'),
    CategoryModel(
        categoryName: 'Entertaiment', image: 'assets/entertaiment.avif'),
    CategoryModel(categoryName: 'Health', image: 'assets/health.avif'),
    CategoryModel(categoryName: 'General', image: 'assets/general.avif'),
    CategoryModel(categoryName: 'Science', image: 'assets/science.avif'),
    CategoryModel(categoryName: 'Sports', image: 'assets/sports.avif'),
    CategoryModel(categoryName: 'Technology', image: 'assets/technology.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(
              category: categories[index],
            );
          }),
    );
  }
}
