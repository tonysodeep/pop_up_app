import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Builder(
        builder: (context) {
          return WebView(
            initialUrl: 'https://tinhte.vn/',
          );
        },
      ),
    );
  }
}
