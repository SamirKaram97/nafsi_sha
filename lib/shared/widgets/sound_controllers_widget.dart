import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';

import '../styles/colors.dart';
import '../styles/images.dart';
import 'animated_playing_button.dart';
import 'loop_icon_widget.dart';

class SoundControllersWidget extends StatelessWidget {
   const SoundControllersWidget(
      {super.key, required this.play, required this.shuffleModeEnabled, required this.loopModeIndex});

  final bool play;
  final bool shuffleModeEnabled;
  final int loopModeIndex;

  //todo
   //add some animation when change buttons

  @override
  Widget build(BuildContext context) {
    var cubit = SoundsCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                cubit.changeShuffleMode();
              },
              icon: SvgPicture.asset(Assets.imagesShuffleIcon,color: shuffleModeEnabled?AppColors.lightBlue:null,)),
          IconButton(
              onPressed: () {
                cubit.loadPreviousSound();
              },
              icon: SvgPicture.asset(Assets.imagesLeftMusicIcon)),
          // InkWell(
          //     borderRadius: BorderRadius.circular(30),
          //     onTap: () {
          //       cubit.playOrPauseSound();
          //     },
          //     child: CircleAvatar(
          //       radius: 45,
          //       backgroundColor: AppColors.lightBlue,
          //       child: Icon(
          //         play ? Icons.pause : Icons.play_arrow,
          //         color: AppColors.whiteColor,
          //         size: 50,
          //       ),
          //     )),
          //todo
          // chose the best
          SizedBox(
            height: 100,
            width: 100,
            child: AnimatedPlayButton(onPressed: (){
              cubit.playOrPauseSound();
            },isPlaying: cubit.play),
          ),
          IconButton(
              onPressed: () {
                cubit.loadNextSound();
              },
              icon: SvgPicture.asset(Assets.imagesRightMusicIcon)),
          IconButton(
              onPressed: () {
                cubit.changeLoopMode();
              },
              icon: LoopIconWidget(loopModeIndex: cubit.loopModeIndex,)),
        ],
      ),
    );
  }
}



