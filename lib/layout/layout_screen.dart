import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';
import 'package:gp_nafsi/screens/Register_info/register_info_screen.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/session_model.dart';
import '../shared/styles/images.dart';
import '../shared/styles/locale.dart';
import '../shared/widgets/custom_app_bar.dart';
import '../shared/widgets/custom_bottom_nav_bar.dart';
import '../shared/widgets/custom_fab.dart';
import '../shared/widgets/language_button.dart';
import '../shared/widgets/layout_body.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with WidgetsBindingObserver {
  BuildContext? _context;
  LayoutCubit? layoutCubit;

  @override
  void initState() {
    LayoutCubit.get(context).layoutInitMethods(context);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose");
    if (layoutCubit!.isLogout == false) {
      layoutCubit?.createSession(_context);
    }
    layoutCubit?.disposeTimers();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _context = context;
    layoutCubit = LayoutCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // if (state == AppLifecycleState.inactive ||
    //     state == AppLifecycleState.detached||state == AppLifecycleState.detached) return;
    // final isBackground = state == AppLifecycleState.paused;

    if (state == AppLifecycleState.resumed) {
      LayoutCubit.get(context).startSessionTimer();
    } else if (state == AppLifecycleState.paused) {
      LayoutCubit.get(context).sessionTimer!.pause();
      LayoutCubit.get(context).createOrUpdateSession(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (BuildContext context, LayoutState state) {
        print(state.runtimeType);
        var layoutCubit = LayoutCubit.get(context);
        print(layoutCubit.userModel?.preferance);
        return PopScope(
          canPop: false,
          onPopInvoked: (v) {
            layoutCubit.backButtonClicked(context);
          },
          child: state is GetUserDataErrorState?Center(child: Text(AppStrings.networkError.tr()),):layoutCubit.userModel == null
              ? const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : layoutCubit.userModel?.age == null
                  ? RegisterInfoScreen()
                  : Scaffold(
                      key: layoutCubit.scaffoldKey,
                      drawer: const CustomDrawer(),
                      backgroundColor: AppColors.scaffoldBackgroundColor,
                      floatingActionButton: const CustomFAB(),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                      bottomNavigationBar: CustomBottomNavBar(
                          currentIndex: layoutCubit.currentIndex),
                      body: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomAppBar(
                                backButton: (layoutCubit.currentIndex == 4 ||
                                    layoutCubit.currentIndex == 5 ||
                                    layoutCubit.currentIndex == 6)),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: LayoutBody(
                                bodyWidget: layoutCubit.layoutBodyWidgets[
                                    layoutCubit.currentIndex],
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
        );
      },
      listener: (BuildContext context, LayoutState state) {},
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      color: AppColors.scaffoldBackgroundColor,
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: SvgPicture.asset(Assets.imagesLogo)),
          const SizedBox(
            height: 100,
          ),
          Text(
            AppStrings.nafsi,
            style: AppStyles.mBold22(context),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppStrings.nafsiDec.tr(),
                textAlign: TextAlign.center,
                style: AppStyles.mRegular16(context)),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              )
            ]),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppStrings.language.tr()),
              onTap: () {
                LocaleHelper.toggleLanguage(context);
              },
            ),
          ),
        ],
      )),
    );
  }
}
