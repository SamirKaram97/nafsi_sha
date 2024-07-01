import 'dart:developer';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gp_nafsi/layout/layout_screen.dart';
import 'package:gp_nafsi/screens/login/cubit/login_cubit.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/shared/network/local/shared_helper.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';



class FaceAuthScreen extends StatefulWidget {
  @override
  _FaceAuthInsideState createState() => _FaceAuthInsideState();
}

class _FaceAuthInsideState extends State<FaceAuthScreen> {
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
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is GetFaceIdSuccess)
          {
            Navigator.pop(context);
          }
      },
      builder: (context, state) {
        var loginCubit=LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Face Authentication'),
          ),
          body: InAppWebView(
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
                // _webViewController.addJavaScriptHandler(
                //     handlerName: 'FlutterChannel',
                //     callback: (args) {
                //       // Handle data received from JavaScript
                //       log("Data from JS: ${args[0]}");
                //     });

                _webViewController.addJavaScriptHandler(
                  handlerName: 'FlutterHandler',
                  callback: (args) {
                    log(args[0].runtimeType.toString());
                    log(args[0].runtimeType.toString());
                    log(args[0].runtimeType.toString());
                    log(args[0].runtimeType.toString());
                    log(args[0].runtimeType.toString());
                    log(args[0].runtimeType.toString());
                    log(args[0]);
                    log(args[0]);
                    log(args[0]);
                    log(args[0]);
                    log(args[0]);
                    log(args[0]);
                    loginCubit.getSaveFaceId(args[0].toString());
                  },
                );
                _webViewController.addJavaScriptHandler(
                  handlerName: 'FlutterErrorHandler',
                  callback: (args) {
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
                return Future.value(
                    JsPromptResponse(action: JsPromptResponseAction.CONFIRM));
              },
              onJsAlert: (controller, jsAlertRequest) {
                return Future.value(
                    JsAlertResponse(action: JsAlertResponseAction.CONFIRM));
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
      },
    );
  }
}



