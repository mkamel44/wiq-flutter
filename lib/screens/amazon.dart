import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AmazonScreen extends StatefulWidget  {
  final InAppBrowser browser = new InAppBrowser();

  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<AmazonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "InAppBrowser",
            )),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () async {
                        await widget.browser.openUrlRequest(
                            urlRequest:
                            URLRequest(url: Uri.parse("https://wiq.ru/tasks.php")),
                            options: InAppBrowserClassOptions(
                                inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                                    crossPlatform: InAppWebViewOptions(
                                      useShouldOverrideUrlLoading: true,
                                      useOnLoadResource: true,
                                    ))));
                      },
                      child: Text("Open In-App Browser")),
                  Container(height: 40),
                  ElevatedButton(
                      onPressed: () async {
                        await InAppBrowser.openWithSystemBrowser(
                            url: Uri.parse("https://wiq.ru/tasks.php"));
                      },
                      child: Text("Open System Browser")),
                ])));
  }
}
