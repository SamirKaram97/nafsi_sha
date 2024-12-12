import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gp_nafsi/features/auth/presentation/controllers/old_login/login_cubit.dart';
import 'package:gp_nafsi/features/auth/presentation/controllers/old_login/login_states.dart';



class LoginFaceScreen extends StatefulWidget {
  const LoginFaceScreen({super.key});

  @override
  State<LoginFaceScreen> createState() => _FaceAuthInsideState();
}

class _FaceAuthInsideState extends State<LoginFaceScreen> {
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
              URLRequest(url: WebUri("https://nafsi.onrender.com/"))),
          // URLRequest(url: Uri.parse("http://10.0.2.2:5500/dd.html"))),
        );
      },
    );
  }
}



