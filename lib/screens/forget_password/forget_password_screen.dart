import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp_nafsi/screens/forget_password/cubit/forget_password_cubit.dart';
import 'package:gp_nafsi/screens/forget_password/cubit/forget_password_states.dart';
import 'package:gp_nafsi/shared/utils/states_handler.dart';
import 'package:gp_nafsi/shared/widgets/login_and_register_title.dart';


import '../../shared/styles/colors.dart';
import '../../shared/styles/components.dart';
import '../../shared/styles/images.dart';
import '../../shared/utils/strings.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/language_button.dart';
import '../../shared/widgets/title_and_text_form_filed.dart';
import '../login/cubit/login_states.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ResetPasswordCubit(),
  child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
  listener: (context, state) {
    StatesHandler.handleResetPasswordStates(state, context);
  },
  builder: (context, state) {
    var forgetCubit=ResetPasswordCubit.get(context);
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
                        title: AppStrings.resetPassword.tr()),
                    const Spacer(),
                    TitleAndTextFormFiled(
                        title: AppStrings.email.tr(),
                        textInputType: TextInputType.emailAddress,
                        controller: forgetCubit.emailController,
                    ),
                    const Spacer(),
                    CustomButton(
                        title: state is ResetPasswordLoadingState
                            ? null
                            : AppStrings.reset.tr(),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            forgetCubit.resetPassword(context);
                          }
                        }),
                    const Spacer(),
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
