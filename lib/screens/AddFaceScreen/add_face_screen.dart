import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';

class FaceProfileAuth extends StatefulWidget {
  const FaceProfileAuth({super.key});

  @override
  State<FaceProfileAuth> createState() => _FaceProfileAuthState();
}

class _FaceProfileAuthState extends State<FaceProfileAuth> {
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
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var layoutCubit=LayoutCubit.get(context);
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
                    layoutCubit.getProfileSaveFaceId(args[0].toString());
                  },
                );
                _webViewController.addJavaScriptHandler(
                  handlerName: 'FlutterErrorHandler',
                  callback: (args) {
                    log(args[0]);
                    showToast(state: ToastState.EROOR, text: AppStrings.someThingWentWrong.tr());
                    Navigator.pop(context);
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


