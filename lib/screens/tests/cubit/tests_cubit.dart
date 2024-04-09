import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/screens/tests/cubit/tests_state.dart';

class TestsCubit extends Cubit<TestsState>
{
  TestsCubit():super(TestsInitialState());
  static TestsCubit get(context)=>BlocProvider.of(context);


}