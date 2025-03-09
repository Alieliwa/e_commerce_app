import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/shared/custom_button.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SkipNextWidget extends StatelessWidget {
   SkipNextWidget({super.key,
     required this.activeIndex,
     required this.onTapPrevious,
     required this.onTapNext,
   });
  int? activeIndex;
   void Function()? onTapPrevious;
   void Function()? onTapNext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: Constans.getSize(context).height *.06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTapPrevious,
            child: Text(
              StringsManager.previousText,
            style: TextStyle(
              color: ColorManager.grayColor,
              fontSize: getResponsiveFontSize(context, fontSize: 18 ),
              fontWeight: FontWeight.w600
            ),
            ),
          ),
          SizedBox(
            height: Constans.getSize(context).height *.01,
            child: AnimatedSmoothIndicator(
              count: 3,
              axisDirection: Axis.horizontal,
              effect: WormEffect(
                dotColor: ColorManager.primaryColor,
                activeDotColor: ColorManager.grayColor,
                dotWidth: Constans.getSize(context).width *.03,
                dotHeight: Constans.getSize(context).height *.015,
              ),
              activeIndex: activeIndex!,
            ),
          ),
          InkWell(
            onTap: onTapNext,
            child: Text(
              StringsManager.nextText,
              style: TextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: getResponsiveFontSize(context, fontSize: 18 ),
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
      ),
    );
  }
}
