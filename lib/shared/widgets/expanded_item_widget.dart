
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ExpandedItemWidget extends StatelessWidget {
  const ExpandedItemWidget({
    super.key, required this.shownText, required this.icon, required this.expandedItems, required this.controller,
  });
  final String shownText;
  final IconData icon;
  final List<Widget> expandedItems;
  final ExpansionTileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        controller: controller,
        childrenPadding: const EdgeInsetsDirectional.all(10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        collapsedBackgroundColor:Colors.white ,
        leading:  Icon(icon),
        title:  Text(shownText,style: AppStyles.mRegular18(context)),
        children: expandedItems,
      ),
    );
  }
}
