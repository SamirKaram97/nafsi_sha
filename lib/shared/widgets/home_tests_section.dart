import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_state.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/test_card.dart';

import 'load_more_button.dart';

class HomeTestsSection extends StatelessWidget {
  const HomeTestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestsCubit, TestsState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppStrings.tests.tr()),
        const SizedBox(
          height: 15,
        ),
        TestCard(testModel: TestsCubit.get(context).tests[0],testIndex: 0),
        const SizedBox(
          height: 15,
        ),
        TestCard(testModel: TestsCubit.get(context).tests[1],testIndex: 1),
        const SizedBox(
          height: 15,
        ),
        TestCard(testModel: TestsCubit.get(context).tests[2],testIndex: 2),
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
  },
);
  }
}
