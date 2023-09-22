import 'package:flutils/core/components/webview/web_view_shared.dart';
import 'package:flutter/material.dart';

///
/// put webview_flutter: in pubspec.yaml file
/// Uncomment WebView and comment WebViewWidget to use it
/// WebViewWidget is my reusable widget
///
class Example3DPage extends StatelessWidget {
  const Example3DPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // SizedBox(
          //   height: 440,
          //   child: WebView(
          //     javascriptMode: JavascriptMode.unrestricted,
          //     initialUrl: 'https://elegant-tanuki-0787ed.netlify.app/',
          //     backgroundColor: Colors.white,
          //   ),
          // ),
          SizedBox(
            height: 440,
            child: WebViewWidget(
              initialUrl: 'https://app.vectary.com/p/1ossbykiRBVLHC8C6tZuKa',
              backgroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Text(
                "This is a 3D space shuttle by using Webview, and there are other ways to display a 3D file. Example: You place a file of type glTF or glb in assets and use the babylonjs_viewer package to display it, but in most cases the size of the files is large, so I didn't give an example of it, and it is preferable to use WebView.",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
