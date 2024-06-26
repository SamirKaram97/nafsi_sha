import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';

import '../styles/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
        height: 70,
        activeIndex: LayoutCubit.get(context).currentIndex,
        borderColor: AppColors.dividerColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        itemCount: LayoutCubit.get(context).items(context).length,
        safeAreaValues: const SafeAreaValues(
            right: false, top: false, left: false, bottom: false),
        tabBuilder: (index, isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                LayoutCubit.get(context).items(context)[index].iconPath,
                color: LayoutCubit.get(context).currentIndex == index
                    ? AppColors.primaryColor
                    : Colors.black,
                width: 25,
                height: 25,
              ),
              const SizedBox(
                height: 5,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  LayoutCubit.get(context).items(context)[index].title,
                  style: LayoutCubit.get(context).currentIndex == index
                      ? AppStyles.mSemiBold12(context)
                          .copyWith(color: AppColors.primaryColor)
                      : AppStyles.mSemiBold12(context),
                ),
              ),
            ],
          );
        },
        onTap: (index) {
          LayoutCubit.get(context).changeBottomNavBarIndex(index, context);
        });
  }
}
