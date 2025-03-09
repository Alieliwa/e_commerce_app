import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/shared/custom_button.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/views/screens/on_boarding_screens/widgets/skip_next_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingWidget extends StatelessWidget {
   OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.activeIndex,
     this.onTapPrevious,
     this.onTapNext,
  });

  String? image;
  String? title;
  String? subTitle;
  int? activeIndex;
   void Function()? onTapPrevious;
   void Function()? onTapNext;


   @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: Constans.getSize(context).width *.04
      ),
      child: Column(
        children: [
          SizedBox(
            height: Constans.getSize(context).height *.06,
          ),
          activeIndex== 2? Container() : Align(
            alignment: Alignment.topRight,
            child: Text(
              StringsManager.skipText,
              style: TextStyle(
                  color: ColorManager.grayColor,
                  fontSize: getResponsiveFontSize(context, fontSize: 18 ),
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          SizedBox(
            height: Constans.getSize(context).height *.06,
          ),
          SvgPicture.asset(
            image!,
             height: Constans.getSize(context).height * .4,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              vertical: Constans.getSize(context).height * .02,
            ),
            child: Text(
             title!,
              textAlign:TextAlign.center ,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 22 ),
                fontWeight: FontWeight.w900,
                color: ColorManager.primaryColor
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              vertical: Constans.getSize(context).height * .02,
            ),
            child: Text(
              subTitle!,
              textAlign:TextAlign.center ,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 16),
                fontWeight: FontWeight.w400,
                color: ColorManager.grayColor
              ),
            ),
          ),
          activeIndex == 2 ?
          Padding(
            padding:  EdgeInsets.symmetric(
              vertical: Constans.getSize(context).height *.05,),
            child: CustomButton(
              onPressed: () {  },
              buttonText: StringsManager.getStartedText,
            ),
          )
         :SkipNextWidget(
            activeIndex: activeIndex!,
            onTapPrevious: onTapPrevious,
            onTapNext: onTapNext,
          ),
        ],
      ),
    );
  }
}
