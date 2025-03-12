import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: Constans.getSize(context).width *.04
      ),
      child: Row(
        children: [

          Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Find everything you can imagine...",
                  prefixIcon:  Icon(Icons.search,),
                  filled: true, // تفعيل الخلفية
                  fillColor: ColorManager.searchColor, // تحديد اللون الأبيض للخلفية
                  hintStyle: TextStyle(
                      color: ColorManager.grayColor,
                      fontFamily: "tajawal",
                      fontWeight: FontWeight.w700,
                      fontSize: getResponsiveFontSize(context, fontSize: 12)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  BorderSide(color:ColorManager.primaryColor)
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  BorderSide(color:ColorManager.searchColor)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  BorderSide(color:ColorManager.searchColor)
                  ),
                ),
              )
          ),
          SizedBox(
            width: Constans.getSize(context).width *.02,
          ),
          SvgPicture.asset(AssetsManager.filterIcon,
            width: Constans.getSize(context).width *.125,
          ),
        ],
      ),
    );
  }
}
