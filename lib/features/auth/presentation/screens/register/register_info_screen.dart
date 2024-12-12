import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/core/utils/app_strings.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';
import 'package:gp_nafsi/shared/styles/styles.dart';
import 'package:gp_nafsi/shared/utils/states_handler.dart';

import '../../controllers/register/register_cubit.dart';
import '../../controllers/register/register_states.dart';
import '../../../../../shared/widgets/custom_button.dart';
import '../../../../../shared/widgets/language_button.dart';
import '../../../../../shared/widgets/preference_selection_section.dart';
import '../../../../../shared/widgets/title_and_text_form_filed.dart';


class RegisterInfoScreen extends StatelessWidget {
  RegisterInfoScreen({super.key});

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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(child: TitleAndTextFormFiled(title: AppStrings.firstName.tr(),controller: registerCubit.firstNameController,)),
                              const SizedBox(width: 10,),
                              Expanded(child: TitleAndTextFormFiled(title: AppStrings.secondName.tr(),controller:  registerCubit.secondNameController,)),],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TitleAndTextFormFiled(title: AppStrings.age.tr(),controller: registerCubit.ageController,textInputType: TextInputType.number),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          Text(
                            AppStrings.selectYourFavourits.tr(),
                            style: AppStyles.mSemiBold38(context),
                            textAlign: TextAlign.center,
                          ),
                          const Flexible(
                              child: PreferenceSelectionSection()),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              title: state is CompleteUserInfoLoadingState
                                  ? null
                                  : AppStrings.submit.tr(),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  registerCubit.completeUserInfo(context);
                                }
                              }),

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
