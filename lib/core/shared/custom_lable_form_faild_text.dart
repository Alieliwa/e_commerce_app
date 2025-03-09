import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/shared/custom_text_form_field.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:flutter/material.dart';

class CustomLableFormFaildText extends StatelessWidget {
   CustomLableFormFaildText({
     super.key,
     required this.hintText,
     required this.labelText,
     required this.icon,
      this.suffixIcon,
       this.obscureText,
       this.controller,
   });
  String? hintText;
  String? labelText;
  Icon? icon;
  Icon? suffixIcon;
   bool? obscureText;
   TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: Constans.getSize(context).height *.01
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText!,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 16),
            fontWeight: FontWeight.w400,
            color: ColorManager.primaryColor
          ),
          ),
          SizedBox(height: Constans.getSize(context).height *.01,),
          CustomTextFormField(
            hint: hintText,
            prefixIcon: icon,
            obscureText: obscureText!,
            suffixIcon: suffixIcon,
            controller: controller,
          )
        ],
      ),
    );
  }
}
