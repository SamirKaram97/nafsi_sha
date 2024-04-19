import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_state.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/sound_controllers_widget.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  //need to refactor more

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoundsCubit, SoundsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=SoundsCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(
                    backButton: true,
                    deep: true,
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: CachedNetworkImage(
                                    width: double.infinity,
                                    imageUrl: cubit.sounds[cubit.currentSound].coverUrl,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                cubit.sounds[cubit.currentSound].name,
                                style: AppStyles.mBold26(context),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              ProgressBar(
                                timeLabelPadding: 5,
                                timeLabelTextStyle: AppStyles.mExtraBold14(context),
                                progress: cubit.currentPositionDuration,
                                total: cubit.soundTotalDuration,
                                onSeek: (duration) {
                                  SoundsCubit.get(context).changeCurrentPosition(duration);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SoundControllersWidget(play: cubit.play,shuffleModeEnabled: cubit.shuffleModeEnabled,loopModeIndex: cubit.loopModeIndex),
                              const SizedBox(
                                height: 60,
                              )
                            ]),
                      ))
                ],
              )),
        );
      },
    );
  }
}

String formatSeconds(int totalSeconds) {
  final int minutes = totalSeconds ~/ 60;
  final int seconds = totalSeconds % 60;

  final String formattedMinutes = minutes.toString().padLeft(1, '0');
  final String formattedSeconds = seconds.toString().padLeft(2, '0');

  return '$formattedMinutes:$formattedSeconds';
}
