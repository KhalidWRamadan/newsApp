import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  const NewsWebView({super.key, required this.articleUrl});
  final String articleUrl;

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  //late String url;
  bool isLoading = true;
  late WebViewController _controller;
  //initializing webview controller once the webview widget is called
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      //disable javascriptMode for more security and boost performance,
      //  any interactive or dynamic features that rely on JavaScript
      // (like animations, pop-ups, or special buttons) won't work.
      ..setJavaScriptMode(JavaScriptMode.disabled)
      //load uri request passed through json model
      ..loadRequest(Uri.parse(widget.articleUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          isLoading
              ? const LinearProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Colors.transparent,
                )
              : const SizedBox(),
          Expanded(
            child: WebViewWidget(
              controller: _controller
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onPageFinished: (_) => setState(
                      () {
                        isLoading = false;
                      },
                    ),
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
