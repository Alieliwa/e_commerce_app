import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/views/screens/aut_screens/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;


class HeadersItem extends StatelessWidget {
  const HeadersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: Constans.getSize(context).width * .04,
        vertical: Constans.getSize(context).height * .02,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context)
              =>LogInScreen(),),);
            },
            child: CircleAvatar(
             maxRadius: Constans.getSize(context).width *.08,
              backgroundColor: ColorManager.grayColor.withOpacity(.3),
              child: Icon(Icons.person,
                color: ColorManager.whiteColor,
                size:Constans.getSize(context).width * .08 ,),
            ),
          ),
          SizedBox(
            width: Constans.getSize(context).width * .02,
          ),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Text(StringsManager.welcomeAhmedText,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 16),
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primaryColor
                ),
              ),
              Text(StringsManager.subTitleText,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 10),
                  fontWeight: FontWeight.w400,
                  color: ColorManager.primaryColor
                ),
              ),

            ],
          ),
          Spacer(),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -12),
            badgeContent: Text("3"),
             badgeStyle: badges.BadgeStyle(
             ),
            child: SvgPicture.asset(
              AssetsManager.compareIcon,
            width:Constans.getSize(context).width * .06,
            ),
          ),
          SizedBox(
            width: Constans.getSize(context).width * .04,
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -12),
            badgeContent: Text("3"),
             badgeStyle: badges.BadgeStyle(
             ),
            child: Icon(Icons.shopping_cart_outlined,
            color: ColorManager.primaryColor,
              size:Constans.getSize(context).width * .07 ,
            ),
          ),

          
        ],
      ),
    );
  }
}
