import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/news_tile_item.dart';
import 'package:news_app_ui_setup/models/news_model.dart';

// we used StatefulWidget to use the initState method
// which gives us the ability to do things in the Initialization stage of the
// widget which is also the first stage in the widget's lifecycle
class NewsTileListview extends StatelessWidget {
  const NewsTileListview({
    super.key,
    required this.articles,
  });
  final List<NewsModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: NewsTileItem(
              article: articles[index],
            ),
          );
        },
      ),
    );

    // return ListView.builder(
    //   //makes the ui bounce when reaching the last item in the list
    //   //removes the annoying feeling of having 2 integrated scroallable items,
    //   //custom scrollView and listView builder in our case so we make the listView
    //   //unscrollable
    //   physics: const NeverScrollableScrollPhysics(),
    //   //builds all the items once the screen shows(not adviced) might cause lagging
    //   // due to large number of items built
    //   shrinkWrap: true,

    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return const Padding(
    //       padding: EdgeInsets.only(bottom: 16.0),
    //       child: NewsTileItem(),
    //     );
    //   },
    // );
  }
}
