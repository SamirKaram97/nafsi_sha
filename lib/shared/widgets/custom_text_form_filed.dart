
import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:flutter/material.dart';
import 'package:gp_nafsi/screens/register/cubit/register_cubit.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:validators/validators.dart' as validators;
import 'package:intl/intl.dart' as intl;
import '../styles/colors.dart';

class CustomTextFormFiled extends StatefulWidget {
    const CustomTextFormFiled({
    super.key,
    required this.controller, this.value, this.textInputType, required this.title,


  });

  final TextEditingController controller;
  final String? value;
    final TextInputType? textInputType;
    final String title;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      textDirection: isRTL(widget.controller.text) ?TextDirection.rtl:TextDirection.ltr,
      controller: widget.controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          filled: true,
          fillColor: AppColors.greyColor),
      validator: (value) {
        if(widget.textInputType == TextInputType.emailAddress)
          {
            return emailValidatorMethod(value, context);
          }
        else if(widget.title==AppStrings.age.tr())
          {
            return ageValidatorMethod(value,context);
          }
        else if(widget.title==AppStrings.firstName.tr()||widget.title==AppStrings.secondName.tr())
          {
            return fNameValidatorMethod(value);
          }
      //  Ewqeq111@eqwewq.com
      },
      onChanged: (e){
        setState(() {

        });
      },
    );
  }

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  String? emailValidatorMethod(String? email, context) {
    if (email!.isEmpty) {
      return AppStrings.emailMustBeNotEmpty.tr();
    }
    else if (!validators.isEmail(email)) {
      return AppStrings.pleaseEnterACorrectEmail.tr();
    }
  }

  String? fNameValidatorMethod(String? name) {
    if (name!.isEmpty) {
     return AppStrings.mustBeNotEmpty.tr();
    }
  }

}
String? ageValidatorMethod(String? age, context) {
    if (age!.isEmpty) {
      return AppStrings.ageMustBeNotEmpty.tr();
    }
    else if (!validators.isNumeric(age)) {
      return AppStrings.pleaseEnterAValidAge.tr();
    }
    else if (int.parse(age)<=18) {
      return AppStrings.ageMustAbove18.tr();
    }
  }



class CustomPasswordTextFormFiled extends StatefulWidget {
  const CustomPasswordTextFormFiled({
    super.key,
    required this.controller,
    this.value, this.textInputType, required this.title
  });

  final TextEditingController controller;
  final String? value;
  final String title;
  final TextInputType? textInputType;

  @override
  State<CustomPasswordTextFormFiled> createState() => _CustomPasswordTextFormFiledState();
}

class _CustomPasswordTextFormFiledState extends State<CustomPasswordTextFormFiled> {
  bool isPasswordShown=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      initialValue: widget.value,
      textDirection: isRTL(widget.controller.text) ?TextDirection.rtl:TextDirection.ltr,
      obscureText: isPasswordShown,
      controller: widget.controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          filled: true,
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isPasswordShown=!isPasswordShown;
                });
              },
              child: Icon(isPasswordShown
                  ? Icons.visibility_off
                  : Icons.visibility)),
          fillColor: AppColors.greyColor),
      validator: (value) {
        if(widget.title==AppStrings.confirmPassword.tr())
          {
            return cPasswordValidatorMethod(RegisterCubit.get(context).passwordController.text, context, RegisterCubit.get(context).cPasswordController.text);
          }
        return passwordValidatorMethod(value, context);
      },
      onChanged: (v){
        setState(() {

        });
      },
    );
  }

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  String? passwordValidatorMethod(String? password, context) {
    if (password!.isEmpty) {
      return AppStrings.passwordMustBeNotEmpty.tr();
    }
    else if (password.length < 6) {
      return AppStrings.passwordMustBeMoreThan6.tr();
    }
  }
  String? cPasswordValidatorMethod(String? password, context,String? cPassword) {
    if (cPassword!.isEmpty) {
      return AppStrings.passwordMustBeNotEmpty.tr();
    }
    else if (cPassword.length < 6) {
      return AppStrings.passwordMustBeMoreThan6.tr();
    }
    else if(password!=cPassword)
    {
      return AppStrings.passwordMustMatch.tr();
    }
  }
}
