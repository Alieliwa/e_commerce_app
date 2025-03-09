import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:flutter/material.dart';

class RememberAndForgetPass extends StatefulWidget {
  const RememberAndForgetPass({super.key});

  @override
  State<RememberAndForgetPass> createState() => _RememberAndForgetPassState();
}

class _RememberAndForgetPassState extends State<RememberAndForgetPass> {
bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: Constans.getSize(context).height * .02,
              width:Constans.getSize(context).height * .03,
              child: Checkbox(
                  value: isChecked,
                  activeColor: ColorManager.primaryColor,
                  onChanged: (newVal){
                    setState(() {
                      isChecked = !isChecked;
                      print(isChecked);
                    });
                  }),
            ),
            SizedBox(width: Constans.getSize(context).width *.01,),
            Text(StringsManager.rememberMeText,
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 12),
              fontWeight: FontWeight.w400,
              color: ColorManager.primaryColor
            ),
            ),
          ],
        ),
        Text(
          StringsManager.forgetPasswordText,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: getResponsiveFontSize(context, fontSize: 12),
          color: ColorManager.primaryColor
        ),
        )
      ],
    );
  }
}
