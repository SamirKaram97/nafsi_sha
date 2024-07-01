import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/layout/cubit/layout_states.dart';
import 'package:gp_nafsi/models/user_model.dart';
import 'package:gp_nafsi/screens/change_info/cubit/change_info_states.dart';
import 'package:gp_nafsi/shared/utils/states_handler.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/custom_app_bar.dart';
import 'package:gp_nafsi/shared/widgets/custom_button.dart';
import 'package:gp_nafsi/shared/widgets/title_and_text_form_filed.dart';

import '../../shared/widgets/profile_avatar_image.dart';
import 'cubit/change_info_cubit.dart';

class ChangeInfoScreen extends StatelessWidget {
  const ChangeInfoScreen({super.key, required this.userModel});
  final UserModel userModel;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeInfoCubit()..fillTextForms(userModel),
      child: BlocConsumer<ChangeInfoCubit,ChangeInfoState>(
        listener: (context, state) {
          StatesHandler.handleUpdateUserDateStates(state, context);
        },
        builder: (context, state) {
          ChangeInfoCubit changeInfoCubit=ChangeInfoCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const CustomAppBar(backButton: true,deep: true,),
                  Expanded(child: SingleChildScrollView(
                    child: Form(
                      key: changeInfoCubit.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Hero(tag: userModel.id??"avatar",child: AvatarImage(h: 130,w: 130,)),
                              IconButton(onPressed: (){
                                changeInfoCubit.getProfileImage(context);
                              }, icon: const Icon(Icons.camera,color: Colors.white,))
                            ],
                          ),
                          const SizedBox(height: 12,),
                          Row(
                            children: [
                              Expanded(child: TitleAndTextFormFiled(value: "dsad",title: AppStrings.firstName.tr(),controller: changeInfoCubit.firstNameController)),
                              const SizedBox(width: 10,),
                              Expanded(child: TitleAndTextFormFiled(value: "dsadas",title: AppStrings.secondName.tr(),controller:  changeInfoCubit.secondNameController,)),
                            ],
                          ),
                          // const SizedBox(height: 12,),
                          // TitleAndTextFormFiled(title: AppStrings.email.tr(),controller: changeInfoCubit.emailController,cubit: changeInfoCubit,textInputType: TextInputType.emailAddress),
                          // const SizedBox(height: 12,),
                          // TitleAndTextFormFiled(title: AppStrings.password.tr(),controller: changeInfoCubit.passwordController,cubit: changeInfoCubit),
                          const SizedBox(height: 12,),
                          TitleAndTextFormFiled(title: AppStrings.age.tr(),controller: changeInfoCubit.ageController,textInputType: TextInputType.number),
                          const SizedBox(height: 12,),
                          CustomButton(title: state is ChangeUserInfoLoadingState
                              ? null
                              :AppStrings.update.tr(), onPressed: (){
                            if(changeInfoCubit.formKey.currentState!.validate())
                              {
                                changeInfoCubit.changeUserInfo(context);
                              }
                          }),
                          const SizedBox(height: 12,),
                        ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
