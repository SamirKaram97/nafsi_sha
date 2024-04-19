import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_cubit.dart';
import 'package:gp_nafsi/screens/videos/cubit/videos_state.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:gp_nafsi/shared/widgets/video_card.dart';
import 'package:gp_nafsi/generated/l10n.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideosCubit, VideosState>(
      listener: (context, state) {},
      builder: (context, state) {
        var videosCubit = VideosCubit.get(context);
        if(state is GetVideosLoadingState)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
        else if(state is GetVideosSuccessState)
          {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: S.of(context).videos),
                const SizedBox(
                  height: 15,
                ),
                Expanded(child: ListView.separated(
                    itemBuilder: (context, index) {
                      return VideoCard(
                        videoResponse: state.videos![index]!,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: state.videos!.length))
              ],
            );
          }
        else if(state is GetVideosErrorState)
          {
            return Center(child: Text(state.errorMessage),);
          }
        return const SizedBox();
         /*
        if(state is GetVideosLoadingState)
          {
            return const CircularProgressIndicator();
          }
        else if(state is GetVideosSuccessState)

        {return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: S.of(context).videos),
            const SizedBox(height: 15,),
            Expanded(child: ListView.separated(itemBuilder: (context, index) {
              return VideoCard(videoResponse: state.videos![index]!,);
            }, separatorBuilder: (context, index) {
              return const SizedBox(height: 20,);
            }, itemCount: state.videos!.length))
          ],
        );}
        return Text("dsad");*/
      },
    );
  }
}
