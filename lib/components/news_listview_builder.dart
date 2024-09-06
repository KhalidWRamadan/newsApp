import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/news_tile_listview.dart';
import 'package:news_app_ui_setup/models/news_model.dart';

import 'package:news_app_ui_setup/services/news_services.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // //we have to prepare the requested data before building our widget
  // //it's not suitable to do that in the build method because we must make it async
  // //also another disadvantage is that everytime the widget is rebuilt the request
  // //is called again, more requests means more money
  // List<NewsModel>? articles = [];
  // //a flag to use once the data is fetched
  // bool isLoading = true;
  // //we used this function because it is not allowed to make initState an async
  // //so we used this method to request and wait the data
  // Future<void> holder() async {
  //   articles = await NewsServices().getNews();
  //   //make the flag false once the data is fetched to rebuild the ui and show
  //   // news instead of loading bar
  //   isLoading = false;
  //   //at this point initState triggers the holder method and does not wait
  //   //it to finish because it is not an async, so it moves on to the build stage
  //   //without the data so nothing appears. We can simply use the built-in setState
  //   // function to rebuild the ui right after the data is fetched so after the assaigment
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   holder();
  // }

  Future<List<NewsModel>?>? future;
  @override
  void initState() {
    super.initState();
    future = NewsServices().getNews(category: 'general');
  }

  @override
  Widget build(BuildContext context) {
    return
        //Future builder is an easier way to deal with data that is requested from an api
        //future parameter takes a future type which includes the request
        //the builder is a callBack that has the context of the method and a snapshot
        //snapshot is simply the retrived data from future request
        FutureBuilder(
            //we don't trigger the getNews method directly here because this widget could be
            // rebuilt multiple times which means triggering the request many times
            //and that is costful, instead we trigger the request in initState to gurantee
            //it's made once and then send the future data to the builder to wait and handle
            future: future,
            builder: (context, snapshot) {
              //some error happened while recieving data
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error has occured, please try again later.'),
                );
              }
              //data recived successfully
              if (snapshot.hasData) {
                return NewsTileListview(
                  articles: snapshot.data!,
                );
                //no data recieved and no errors happened, show loading indicator
              } else {
                return const SliverFillRemaining(
                  //no scroll while in progress
                  hasScrollBody:
                      false, // This makes sure the progress indicator is centered
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            });

    // Widget validator() {
    //   if (isLoading || articles == null) {
    //     return const SliverFillRemaining(
    //       //no scroll while in progress
    //       hasScrollBody:
    //           false, // This makes sure the progress indicator is centered
    //       child: Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    //   }
  }
}
