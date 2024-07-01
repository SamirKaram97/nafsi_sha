import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp_nafsi/screens/face_auth/face_auth_screen.dart';
import 'package:gp_nafsi/screens/forget_password/forget_password_screen.dart';
import 'package:gp_nafsi/screens/login/cubit/login_cubit.dart';
import 'package:gp_nafsi/screens/login/cubit/login_states.dart';
import 'package:gp_nafsi/screens/register/cubit/register_states.dart';
import 'package:gp_nafsi/screens/register/register_screen.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/components.dart';
import 'package:gp_nafsi/shared/styles/images.dart';
import 'package:gp_nafsi/shared/styles/locale.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/states_handler.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/shared/widgets/divder_with_or_section.dart';

import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/language_button.dart';
import '../../shared/widgets/login_and_register_title.dart';
import '../../shared/widgets/social_media_buttons.dart';
import '../../shared/widgets/title_and_text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        StatesHandler.handleLoginStates(state, context);
      },
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).viewPadding.bottom,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(alignment: AlignmentDirectional.centerEnd,child: LanguageButton()),
                        const Spacer(),
                        SvgPicture.asset(Assets.imagesLogo),
                        const Spacer(),
                        LoginAndRegisterTitle(
                            title: AppStrings.loginToStartWithNafsy.tr()),
                        const Spacer(),
                        TitleAndTextFormFiled(
                            title: AppStrings.email.tr(),
                            controller: loginCubit.emailController,
                            textInputType: TextInputType.emailAddress,
                        ),
                        const Spacer(),
                        TitleAndTextFormFiled(
                          title: AppStrings.password.tr(),
                          controller: loginCubit.passwordController,

                        ),
                        InkWell(
                            onTap: () {
                              navTo(context,  ResetPasswordScreen());
                            },
                            child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  AppStrings.forgotPassword.tr(),
                                  style: AppStyles.mMedium14(context),
                                ))),
                        const Spacer(),
                        CustomButton(
                            title: state is LoginLoadingState
                                ? null
                                : AppStrings.signIn.tr(),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginCubit.login(
                                    context,
                                    loginCubit.emailController.text,
                                    loginCubit.passwordController.text);
                              }
                            }),
                        const Spacer(),
                        const DividerWithOrSection(),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialMediaButtons(
                                googleOnPressed: () =>
                                    loginCubit.userLoginGoogle(context),
                                facebookOnPressed: () =>
                                    loginCubit.userLoginFace(context)),
                            const SizedBox(width: 18),
                            InkWell(
                              onTap: (){
                                navTo(context, FaceAuthScreen());
                              },
                              child: Container(

                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 1, color: Color(0xFFF4F4F4)),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Image.asset("assets/images/face_recognition.png",fit: BoxFit.fill,height: 30,
                                    width: 30,),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppStrings.dontHaveAnAccount.tr(),
                              style: AppStyles.mRegular16(context),
                            ),
                            InkWell(
                              onTap: () {
                                navTo(context, RegisterScreen());
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  AppStrings.signUp.tr(),
                                  style: AppStyles.mRegular16(context)
                                      .copyWith(
                                          color: AppColors.primaryColor),
                                ),
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
    );
  }
}

