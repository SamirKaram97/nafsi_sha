import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/images.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/extintions.dart';
import 'package:gp_nafsi/shared/utils/states_handler.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/divder_with_or_section.dart';
import 'package:gp_nafsi/shared/widgets/login_and_register_title.dart';

import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/social_media_buttons.dart';
import '../../shared/widgets/title_and_text_form_filed.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          StatesHandler.handleRegisterStates(state,context);
        },
        builder: (context, state) {
          var registerCubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          SvgPicture.asset(Assets.imagesLogo),
                          const Spacer(),
                          LoginAndRegisterTitle(title: AppStrings.signUpToStartWithNafsy,),
                          const Spacer(),
                          TitleAndTextFormFiled(
                            cubit: registerCubit,
                              title: AppStrings.email,
                              controller: registerCubit.emailController),
                          const Spacer(),
                          TitleAndTextFormFiled(
                              cubit: registerCubit,
                              title: AppStrings.password,
                              controller: registerCubit.passwordController),
                          const Spacer(),
                          CustomButton(title: AppStrings.createMyAccount, onPressed: () {
                            if(formKey.currentState!.validate())
                              {
                            registerCubit.register();
                              }
                          }),
                          const Spacer(),
                          const DividerWithOrSection(),
                          const Spacer(),
                          const SocialMediaButtons(),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(AppStrings.alreadyHaveAnAccount,style: AppStyles.mRegular16(context),),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(AppStrings.signIn.toTitleCase(),style: AppStyles.mRegular16(context).copyWith(color: AppColors.primaryColor),),
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

