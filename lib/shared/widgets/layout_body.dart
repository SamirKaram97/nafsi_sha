import 'package:flutter/material.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key, required this.bodyWidget});

  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {

    return bodyWidget;
  }
}
