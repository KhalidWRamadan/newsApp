import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/news_listview_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: CustomScrollView(
          slivers: [NewsListViewBuilder()],
        ),
      ),
    );
  }
}
