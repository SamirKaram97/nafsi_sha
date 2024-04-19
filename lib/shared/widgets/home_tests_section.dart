import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/test_card.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import 'load_more_button.dart';

class HomeTestsSection extends StatelessWidget {
  const HomeTestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: S.of(context).tests),
        const SizedBox(
          height: 15,
        ),
        const TestCard(),
        const SizedBox(
          height: 15,
        ),
        const TestCard(),
        const SizedBox(
          height: 15,
        ),
        const TestCard(),
        const SizedBox(
          height: 15,
        ),
        LoadMoreButton(
          onTab: () {
            LayoutCubit.get(context).changeBottomNavBarIndex(6, context);
          },
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
