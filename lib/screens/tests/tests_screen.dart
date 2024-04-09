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
    return  BlocProvider(
      create: (context) => TestsCubit(),
      child: BlocConsumer<TestsCubit,TestsState>(
        listener: (context, state) {},
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: AppStrings.tests),
            const SizedBox(height: 15,),
            Expanded(child: ListView.separated(itemBuilder: (context, index) {
              return const TestCard();
            }, separatorBuilder: (context, index) {
              return const SizedBox(height: 15,);
            }, itemCount: 10))
          ],
        ),
      ),
    );
  }
}
