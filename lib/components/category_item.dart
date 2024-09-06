import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/views/category_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const CategoryView();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          height: 120,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            //DecorationImage allows adding an image as a background and modify
            image: DecorationImage(
              //makes the image fit into the container
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ),
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
