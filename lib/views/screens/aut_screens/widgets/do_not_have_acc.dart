import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/views/screens/aut_screens/screens/singup_screen.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccWidget extends StatelessWidget {
  const DoNotHaveAccWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Constans.getSize(context).height *.02
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(StringsManager.doNotHaveAccText,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 12),
            fontWeight: FontWeight.w400,
            color: ColorManager.primaryColor,
          ),
          ),
          SizedBox(width: Constans.getSize(context).width *.01,),
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> SignupScreen()));
            },
            child: Text(StringsManager.signUpText,
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 13),
              fontWeight: FontWeight.w600,
              color: ColorManager.primaryColor,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
