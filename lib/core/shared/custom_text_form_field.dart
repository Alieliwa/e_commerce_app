import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({super.key,
      this.controller,
     this.prefixIcon,
     this.suffixIcon,
      this.obscureText,
     this.hint});
  String? hint ;
  String? value;
  // void Function(String?)? onSaved;
   TextEditingController? controller;
   Widget? prefixIcon;
   Widget? suffixIcon;
   bool? obscureText;

   @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.primaryColor,
      obscureText: obscureText!,
      controller:  controller,
      // onSaved: onSaved,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please fill in the title";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10),
            borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorManager.primaryColor ,
            )
        ),
      ),

    );
  }
}
