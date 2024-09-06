import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/categories_listview.dart';
import 'package:news_app_ui_setup/components/news_listview_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // لون شفاف
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Text(
              'App',
              style: TextStyle(fontSize: 24, color: Color(0xFFebd294)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomScrollView(
          slivers: [
            //sliver to box adapter converts a widget to a sliver because
            //CustomScrollView only accepts sliver type
            //normally customScrollViews don't accept listView.builder or expanded
            //due to their unbounded height
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            const NewsListViewBuilder(),
            //Expanded could not be used in this case because customScroll view
            //does not allow unbounded heights
            // const SliverToBoxAdapter(
            //   child: NewsTileListview(),
            // ),
          ],
        ),
        // this code is rejected because the category keeps on the top while scrolling
        // in the news tile which feels annoying so we used custom scroll views
        // child: Column(
        //   children: [
        //     CategoriesListView(),
        //     const SizedBox(
        //       height: 32,
        //     ),
        //     //expanded makes the lisview to adapt to it's size
        //     const Expanded(child: NewsTileListview()),
        //   ],
        // ),
      ),
    );
  }
}
