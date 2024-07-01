import 'package:easy_localization/easy_localization.dart';
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
import '../../shared/widgets/language_button.dart';
import '../../shared/widgets/social_media_buttons.dart';
import '../../shared/widgets/title_and_text_form_filed.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          StatesHandler.handleRegisterStates(state, context);
        },
        builder: (context, state) {
          var registerCubit = RegisterCubit.get(context);
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: LanguageButton()),

                          Flexible(child: SvgPicture.asset(Assets.imagesLogo)),

                          LoginAndRegisterTitle(
                            title: AppStrings.signUpToStartWithNafsy.tr(),
                          ),

                          TitleAndTextFormFiled(

                              title: AppStrings.email.tr(),
                              textInputType: TextInputType.emailAddress,
                              controller: registerCubit.emailController),

                          TitleAndTextFormFiled(

                              title: AppStrings.password.tr(),
                              controller: registerCubit.passwordController),

                          TitleAndTextFormFiled(

                              title: AppStrings.confirmPassword.tr(),
                              controller: registerCubit.cPasswordController),

                          CustomButton(
                              title: state is RegisterLoadingState
                                  ? null
                                  : AppStrings.createMyAccount.tr(),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  registerCubit.register(
                                      context,
                                      registerCubit.emailController.text,
                                      registerCubit.passwordController.text);
                                }
                              }),

                          const DividerWithOrSection(),

                          SocialMediaButtons(
                              googleOnPressed: () =>
                                  registerCubit.userRegisterGoogle(context),
                              facebookOnPressed: () =>
                                  registerCubit.userRegisterFace(context)),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppStrings.alreadyHaveAnAccount.tr(),
                                style: AppStyles.mRegular16(context),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    AppStrings.signIn.tr().toUpperCase(),
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
      ),
    );
  }
}
