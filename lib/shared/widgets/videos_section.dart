import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_state.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';
import 'package:gp_nafsi/shared/widgets/videos_horizontal_list.dart';

import '../../models/video_model.dart';
import '../styles/images.dart';
import '../styles/styles.dart';
import '../utils/strings.dart';
import 'load_more_button.dart';
import 'package:gp_nafsi/generated/l10n.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideosCubit, VideosState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is GetVideosLoadingState)
        {
          return const Center(child: CircularProgressIndicator(),);
        }
        else if(state is GetVideosSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: S
                  .of(context)
                  .videos),
              const SizedBox(
                height: 15,
              ),
              VideosHorizontalList(
                // videos: state.videos,
                videos: state.videos,
              ),
              const SizedBox(
                height: 35,
              ),
              LoadMoreButton(
                onTab: () {
                  LayoutCubit.get(context).changeBottomNavBarIndex(
                      4, context);
                },
              ),
            ],
          );
        }
        else if(state is GetVideosErrorState)
        {
          return Center(child: Text(state.errorMessage),);
        }
        return const SizedBox();
      },
    );
  }
}
