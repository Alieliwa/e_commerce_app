import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  void Function()? onPressed;
  String? buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      height: Constans.getSize(context).height *.07,
      minWidth: double.infinity,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: ColorManager.primaryColor,
      child: Text(
        buttonText!,
        style: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 18),
          fontWeight: FontWeight.w700,
          color: ColorManager.whiteColor,
        ),
      ),
    );
  }
}
