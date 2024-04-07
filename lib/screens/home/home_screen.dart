import 'package:flutter/material.dart';

import '../../shared/widgets/articles_section.dart';
import '../../shared/widgets/home_tests_section.dart';
import '../../shared/widgets/mood_tracker_section.dart';
import '../../shared/widgets/videos_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    const SingleChildScrollView(
      child: Column(
        children: [
          MoodTrackerSection(),
          SizedBox(height: 32,),
          VideosSection(),
          SizedBox(height: 35,),
          ArticlesSection(),
          SizedBox(height: 35,),
          HomeTestsSection(),
        ],
      ),
    );
  }
}
