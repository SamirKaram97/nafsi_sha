import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_cubit.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_state.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/test_card.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';


class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestsCubit, TestsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var testCubit=TestsCubit.get(context);
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: AppStrings.tests.tr()),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return TestCard(testModel: testCubit.tests[index], testIndex: index,);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: testCubit.tests.length))
        ],
      );
      },
    );
  }
}
