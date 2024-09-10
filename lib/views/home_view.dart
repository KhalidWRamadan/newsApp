import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/categories_listview.dart';
import 'package:news_app_ui_setup/components/news_listview_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomScrollView(
          slivers: [
            //scrollable app bar
            const SliverAppBar(
              floating: true, // Makes the app bar reappear when scrolling up
              snap:
                  true, // Makes the app bar immediately appear when scrolling up
              pinned:
                  false, // Set to true if you want to always show a part of the app bar
              //expandedHeight: 200.0, // Height of the app bar when expanded
              elevation: 0,
              backgroundColor: Colors.white,
              //backgroundColor: Colors.white,
              title: Row(
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
            const NewsListViewBuilder(category: 'general'),
            //Expanded could not be used in this case because customScroll view
            //does not allow unbounded heights
            // const SliverToBoxAdapter(
            //   child: NewsTileListview(),
            // ),
          ],
        ),
      ),
    );
  }
}
