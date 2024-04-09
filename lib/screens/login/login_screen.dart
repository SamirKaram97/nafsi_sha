import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp_nafsi/screens/login/cubit/login_cubit.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/screens/register/cubit/register_states.dart';
import 'package:gp_nafsi/screens/register/register_screen.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/styles/images.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/states_handler.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/divder_with_or_section.dart';

import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/login_and_register_title.dart';
import '../../shared/widgets/social_media_buttons.dart';
import '../../shared/widgets/title_and_text_form_filed.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          StatesHandler.handleLoginStates(state,context);
        },
        builder: (context, state) {
          var loginCubit = LoginCubit.get(context);
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
                          LoginAndRegisterTitle(title: AppStrings.loginToStartWithNafsy),
                          const Spacer(),
                          TitleAndTextFormFiled(
                              title: AppStrings.email,
                              controller: loginCubit.emailController,cubit: loginCubit),
                          const Spacer(),
                          TitleAndTextFormFiled(
                              title: AppStrings.password,
                              controller: loginCubit.passwordController,cubit: loginCubit,),
                          InkWell(
                              onTap: () {},
                              child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                    AppStrings.forgotPassword,
                                    style: AppStyles.mMedium14(context),
                                  ))),
                          const Spacer(),
                          CustomButton(title: state is LoginLoadingState?null:AppStrings.signIn, onPressed: () {
                            if(formKey.currentState!.validate())
                              {
                                loginCubit.login();
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
                              Text(AppStrings.dontHaveAnAccount,style: AppStyles.mRegular16(context),),
                              InkWell(
                                onTap: () {
                                  navTo(context,  RegisterScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(AppStrings.signUp,style: AppStyles.mRegular16(context).copyWith(color: AppColors.primaryColor),),
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




