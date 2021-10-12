import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GoogleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  InAppWebView(
        initialUrlRequest : URLRequest(url: Uri.parse("https://wiq.ru/login.php")),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,

          ),
        )
    );
  }
}
