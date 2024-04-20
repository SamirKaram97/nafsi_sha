import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState>
{
  HomeCubit():super(HomeInitState());
  static HomeCubit get(context)=>BlocProvider.of(context);

  /*Future<File> pickImage() async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.camera);
    return File(pickedFile!.path);
  }*/
}