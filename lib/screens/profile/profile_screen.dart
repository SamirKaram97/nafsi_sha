import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';
import 'package:gp_nafsi/shared/widgets/load_more_button.dart';
import 'package:gp_nafsi/shared/widgets/update_user_data_button.dart';

import '../../shared/widgets/AddFaceIdButton.dart';
import '../../shared/widgets/expanded_item_widget.dart';
import '../../shared/widgets/logout_profile_button.dart';
import '../../shared/widgets/profile_avatar_image.dart';
import '../../shared/widgets/session_item.dart';
import '../../shared/widgets/title_and_text_form_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController oldPasswordEditingController;
  late TextEditingController newPasswordEditingController;
  final formKey = GlobalKey<FormState>();
  late ExpansionTileController sessionsController;
  late ExpansionTileController changePasswordController;
  late int end;

  @override
  void initState() {
    oldPasswordEditingController = TextEditingController();
    newPasswordEditingController = TextEditingController();
    sessionsController = ExpansionTileController();
    changePasswordController = ExpansionTileController();
    end = 2;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if(state is UpdateUserFaceIdSuccessState)
          {
            showToast(state: ToastState.SUCCESS, text: AppStrings.faceAddedSuccessFullYouCanLoginNow.tr());
          }
        else if(state is UpdateUserFaceIdErrorState)
        {
          showToast(state: ToastState.EROOR, text: state.errorMessage);
        }
        else if(state is GetProfileFaceIdSuccess)
          {
            Navigator.pop(context);
            LayoutCubit.get(context).updateUserFaceId(state.faceId, context);
          }
      },
      builder: (context, state) {
        var layoutcubit = LayoutCubit.get(context);
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: layoutcubit.userModel?.id ?? "avatar",
                    child: AvatarImage()),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${layoutcubit.userModel?.fName ?? ""} ${layoutcubit.userModel?.lName ?? ""}",
                  style: AppStyles.mSemiBold22(context),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    ExpandedItemWidget(
                        controller: sessionsController,
                        icon: Icons.refresh,
                        shownText: AppStrings.sessions.tr(),
                        expandedItems: [
                          for(int i=0;i<end;i++)
                            if(i<LayoutCubit.get(context).userSessions.length)
                              SessionItem(customUISessionModel: LayoutCubit.get(context).userSessions[i])
                          ,if(end<LayoutCubit.get(context).userSessions.length)Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: LoadMoreButton(
                              onTab: (){
                                setState(() {
                                  end+=5;
                                });
                              },
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 24,
                    ),
                    ExpandedItemWidget(
                        controller: changePasswordController,
                        icon: Icons.password,
                        shownText: AppStrings.changePassword.tr(),
                        expandedItems: [
                          TitleAndTextFormFiled(
                              title: AppStrings.password.tr(),
                              controller: oldPasswordEditingController),
                          const SizedBox(
                            height: 5,
                          ),
                          TitleAndTextFormFiled(
                              title: AppStrings.newPassword.tr(),
                              controller: newPasswordEditingController),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomButton(
                              title: state is ChangePasswordLoadingStata
                                  ? null
                                  : AppStrings.update.tr(),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  layoutcubit.changeUserPassword(
                                      oldPasswordEditingController.text,
                                      newPasswordEditingController.text,
                                      context);
                                }
                              })
                        ]),
                    const SizedBox(
                      height: 24,
                    ),
                    const UpdateUserDataButton(),
                    const SizedBox(
                      height: 24,
                    ),
                     AddFaceIdButton(),
                    const SizedBox(
                      height: 24,
                    ),
                    LogoutProfileButton(layoutCubit: layoutcubit),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
