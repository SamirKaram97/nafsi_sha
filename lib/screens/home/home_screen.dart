import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/home/cubit/home_cubit.dart';
import 'package:gp_nafsi/screens/home/cubit/home_state.dart';

import '../../shared/widgets/articles_section.dart';
import '../../shared/widgets/home_tests_section.dart';
import '../../shared/widgets/mood_tracker_section.dart';
import '../../shared/widgets/videos_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const SingleChildScrollView(
          child: Column(
            children: [
              MoodTrackerSection(),

              //space
              SizedBox(height: 32,),
              VideosSection(),

              //space
              SizedBox(height: 35,),
              ArticlesSection(),

              //space
              SizedBox(height: 35,),
              HomeTestsSection(),
            ],
          ),
        );
      },
    );
  }
}
