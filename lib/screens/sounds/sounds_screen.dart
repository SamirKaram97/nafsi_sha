import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_state.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'package:shimmer/shimmer.dart';
import '../../shared/styles/styles.dart';
import '../../shared/widgets/play_icon_widget.dart';
import '../../shared/widgets/sound_card.dart';


class SoundsScreen extends StatelessWidget {
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SoundsCubit, SoundsState>(
      builder: (context, state) {
        var cubit = SoundsCubit.get(context);
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          SectionTitle(title: AppStrings.sounds.tr()),
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 48,
                        color: AppColors.dividerColor,
                      ),
                  itemBuilder: (context, index) =>
                   cubit.sounds==null?const ShimmerMusicCard(): SoundCard(soundModel: cubit.sounds![index], index: index),
                  itemCount: cubit.sounds==null?10:cubit.sounds!.length))
        ],
      );
      },
      listener: (context, state) {
        if(state is GetSoundsSuccessState)
          {
            SoundsCubit.get(context).init(context);
          }
      },
    );
  }
}

class ShimmerMusicCard extends StatelessWidget {
  const ShimmerMusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.withOpacity(0.2),
      child: ListTile(
        contentPadding: EdgeInsetsDirectional.zero,
        leading: ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Container(color: Colors.white,width: 50,height: 50,),),
        title: Text("~~~~~~~~~~~~",style: AppStyles.mSemiBold18(context).copyWith(color: const Color(0XFF2C2B49)),),
        subtitle: Text("~~~~~",style: AppStyles.mBold18(context),),
        trailing: const Padding(
          padding: EdgeInsetsDirectional.only(end: 14),
          child: PlayIconWidget(),
        ),
      ),
    );
  }
}

