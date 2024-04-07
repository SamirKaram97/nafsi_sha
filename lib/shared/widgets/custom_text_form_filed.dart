
import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:validators/validators.dart' as validators;

import '../styles/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14,horizontal: 10),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          filled: true,
          fillColor: AppColors.greyColor
      ),
      validator: (value) {
        return emailValidatorMethod(value);
      },
    );
  }

  String? emailValidatorMethod(String? email)
  {
    if(email!.isEmpty)
    {
      return AppStrings.emailMustBeNotEmpty;
    }
    if(!validators.isEmail(email))
    {
      return AppStrings.pleaseEnterACorrectEmail;
    }
  }
}


class CustomPasswordTextFormFiled extends StatelessWidget {
   const CustomPasswordTextFormFiled({
    super.key, required this.controller,required this.cubit,

  });

  final TextEditingController controller;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !cubit.isPasswordShown,
      controller: controller,
      decoration:  InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14,horizontal: 10),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          filled: true,
          suffixIcon: InkWell(onTap: (){cubit.changePasswordVisibility();},child:  Icon(cubit.isPasswordShown?Icons.visibility_off:Icons.visibility)),
          fillColor: AppColors.greyColor
      ),
      validator: (value) {
        return passwordValidatorMethod(value);
      },
    );
  }

   String? passwordValidatorMethod(String? password)
   {
     if(password!.isEmpty)
     {
       return AppStrings.passwordMustBeNotEmpty;
     }
     if(password.length<6)
     {
       return AppStrings.passwordMustBeMoreThan6;
     }
   }
}
