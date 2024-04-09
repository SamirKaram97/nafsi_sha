import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/widgets/play_icon_widget.dart';

import '../../models/sound_model.dart';
import '../../screens/music_player/music_player_screen.dart';
import '../../screens/sounds/cubit/sounds_cubit.dart';
import '../styles/components.dart';
import '../styles/styles.dart';

class SoundCard extends StatelessWidget {
  const SoundCard({super.key,required this.soundModel, required this.index});
  final SoundModel soundModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SoundsCubit.get(context).choseSong(index);
        navTo(context, const MusicPlayerScreen());
      },
      child: ListTile(
        contentPadding: EdgeInsetsDirectional.zero,
        leading: ClipRRect(borderRadius: BorderRadius.circular(20.0),child: CachedNetworkImage(
          imageUrl: soundModel.coverUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),),
        title: Text("3:30",style: AppStyles.mSemiBold18(context).copyWith(color: const Color(0XFF2C2B49)),),
        subtitle: Text(soundModel.name,style: AppStyles.mBold18(context),),
        trailing: const Padding(
          padding: EdgeInsets.only(right: 14),
          child: PlayIconWidget(),
        ),
      ),
    );
  }
}