import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

late WebViewControllerPlus _controler;

class LocalWebPage extends StatefulWidget {
  @override
  _LocalWebPageState createState() => _LocalWebPageState();
}

class _LocalWebPageState extends State<LocalWebPage> {
  late InAppWebViewController _webViewController;

  final double _height = 1.0;
  bool initt = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Web Page'),
      ),
      body: InAppWebView(
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
              _webViewController.addJavaScriptHandler(
                handlerName: 'FlutterChannel',
                callback: (args) {
                  // Handle data received from JavaScript
                  log("Data from JS: ${args[0]}");
            });
            _webViewController.addJavaScriptHandler(
              handlerName: 'FlutterHandler',
              callback: (args) {
                // Handle the message from JavaScript
                log('Message from JavaScript: ${args[0]}');
                Navigator.pop(context);
                return null;
              },
            );
          },
          onConsoleMessage: (controller, consoleMessage) {
            log(consoleMessage.message);
          },
          onJsPrompt: (controller, jsPromptRequest) {
            log(jsPromptRequest.message.toString());
            return Future.value(JsPromptResponse(action: JsPromptResponseAction.CONFIRM));
          },
          onJsAlert: (controller, jsAlertRequest) {
            return Future.value(JsAlertResponse(action: JsAlertResponseAction.CONFIRM));
          },
          androidOnPermissionRequest: (controller, origin, resources) {
            log(resources.toString());
            return Future.value(PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT));
          },
          initialUrlRequest:
              URLRequest(url: Uri.parse("https://nafsi.onrender.com/"))),
              // URLRequest(url: Uri.parse("http://10.0.2.2:5500/dd.html"))),
    );
  }
}


class LocalWebPage2 extends StatefulWidget {
  @override
  _LocalWebPage2State createState() => _LocalWebPage2State();
}

class _LocalWebPage2State extends State<LocalWebPage2> {
  late WebViewController controller;

  final double _height = 1.0;
  bool initt = false;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://yellow-andeee-3.tiiny.site/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )..loadFile("assets/reactApp/public/index.html");
      // ..loadRequest(Uri.parse('https://yellow-andeee-3.tiiny.site/'));
    controller.addJavaScriptChannel("FlutterChannel", onMessageReceived: (p0) {
      log(p0.message);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Web Page'),
      ),
      body:WebViewWidget(controller: controller),
      // URLRequest(url: Uri.parse("http://10.0.2.2:5500/dd.html"))),
    );
  }
}











class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Open Local Web Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocalWebPage()),
              );
            },
          ),
          // Add more ListTiles here
        ],
      ),
    );
  }
}
