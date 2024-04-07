import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../utils/strings.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({
    super.key, this.onTab,
  });
  final GestureTapCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTab,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(14),
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.loadMore,
                  style: AppStyles.mMedium12(context),
                ),
                const Icon(Icons.add)
              ],
            ),
          ),
        ),
      ),
    );
  }
}