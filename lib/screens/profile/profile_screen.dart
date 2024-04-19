import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Center(
          child: IconButton(onPressed: () {
            LayoutCubit.get(context).logOut(context);
          }, icon: const Icon(Icons.logout)),);
      },
    );
  }
}
