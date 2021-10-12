import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class AplicativoB2b extends StatefulWidget {
  @override
  _AplicativoB2bState createState() => _AplicativoB2bState();
}

class _AplicativoB2bState extends State<AplicativoB2b> {

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WebView(
        initialUrl: 'https://wiq.ru/login.php',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      floatingActionButton: NavigationControls(_controller.future), // <-- added this
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        var controller = snapshot.data;
        return FloatingActionButton.extended(
          onPressed: !webViewReady
              ? null
              : () => navigate(context, controller!, goBack: true),
          icon: Icon(Icons.arrow_back),
          backgroundColor: Colors.black,
          label: Text("Voltar"),
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
    goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text("Sem histórico anterior")),
      );
    }
  }
}