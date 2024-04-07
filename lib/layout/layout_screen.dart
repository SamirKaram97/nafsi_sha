import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import '../shared/widgets/custom_app_bar.dart';
import '../shared/widgets/custom_bottom_nav_bar.dart';
import '../shared/widgets/custom_fab.dart';
import '../shared/widgets/layout_body.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState>(
      builder: (BuildContext context, LayoutState state) {
        var layoutCubit=LayoutCubit.get(context);
        return  PopScope(
          canPop: false,
          onPopInvoked: (v){
            layoutCubit.backButtonClicked(context);
          },
          child: Scaffold(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            floatingActionButton: const CustomFAB(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomNavBar(currentIndex:layoutCubit.currentIndex ),
            body:  SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomAppBar(backButton: (layoutCubit.currentIndex==4||layoutCubit.currentIndex==5||layoutCubit.currentIndex==6)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: LayoutBody(bodyWidget: layoutCubit.layoutBodyWidgets[layoutCubit.currentIndex],),
                  )),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, LayoutState state) {  },

    );
  }


  }






