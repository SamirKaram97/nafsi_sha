import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_state.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/videos_horizontal_list.dart';

import '../utils/strings.dart';
import 'load_more_button.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideosCubit, VideosState>(
      listener: (context, state) {},
      builder: (context, state) {
        VideosCubit videosCubit = VideosCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: AppStrings.videos.tr()),

            //space
            const SizedBox(height: 15),

            (state is GetVideosErrorState)
                ? Center(child: Text(state.errorMessage))
                : VideosHorizontalList(
                state: state, videos: videosCubit.videos),

            //space
            const SizedBox(height: 35),
            LoadMoreButton(onTab: () {
              LayoutCubit.get(context).changeBottomNavBarIndex(4, context);
            }),
          ],
        );

        return const SizedBox();
      },
    );
  }
}
