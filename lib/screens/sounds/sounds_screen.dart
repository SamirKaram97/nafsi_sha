import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_waveform/just_waveform.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_cubit.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_state.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/section_title.dart';
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as p;
import 'package:flutter/services.dart';
import '../../shared/widgets/sound_card.dart';

class SoundsScreen extends StatelessWidget {
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit= SoundsCubit.get(context);
    return   BlocConsumer<SoundsCubit,SoundsState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const SectionTitle(title: AppStrings.sounds),
          Expanded(child: ListView.separated(separatorBuilder: (context, index) =>  Divider(height: 48,color: AppColors.dividerColor,),itemBuilder: (context, index) =>  SoundCard(soundModel: cubit.sounds[index],index: index),itemCount: cubit.sounds.length))
        ],
      ),
      listener: (context, state) {},
    );
  }

}



