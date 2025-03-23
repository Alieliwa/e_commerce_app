import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
      body: cubit.screens[cubit.currentIndex],
      bottomNavigationBar: Container(
        height: Constans.getSize(context).height *.08,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 3,
                  spreadRadius: 5)
            ]
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: Constans.getSize(context).width *.04,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: (){
                    cubit.changeBottomNavBar(index: 0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: Constans.getSize(context).height *.005,
                    children: [
                      cubit.currentIndex == 0 ?  lineOnItemSelect(context) : Container(),
                      SvgPicture.asset(AssetsManager.homeIcon,
                      width: Constans.getSize(context).width * .06,
                        color: cubit.currentIndex == 0 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                      ),
                      Text(
                        "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        color: cubit.currentIndex == 0 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: (){
                    cubit.changeBottomNavBar(index: 1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: Constans.getSize(context).height *.005,
                    children: [
                      cubit.currentIndex == 1 ?  lineOnItemSelect(context) : Container(),

                      SvgPicture.asset(AssetsManager.cartIcon,
                        color: cubit.currentIndex == 1 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                        width: Constans.getSize(context).width * .07,),
                      Text("Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        color: cubit.currentIndex == 1 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: (){
                    cubit.changeBottomNavBar(index: 2);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: Constans.getSize(context).height *.005,
                    children: [
                      cubit.currentIndex == 2 ?  lineOnItemSelect(context) : Container(),

                      SvgPicture.asset(AssetsManager.categoryIcon,
                        color: cubit.currentIndex == 2 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                        width: Constans.getSize(context).width * .07,),
                      Text("Category",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        color: cubit.currentIndex == 2 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: (){
                    cubit.changeBottomNavBar(index: 3);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: Constans.getSize(context).height *.005,
                    children: [
                      cubit.currentIndex == 3 ?  lineOnItemSelect(context) : Container(),

                      badges.Badge(
                        badgeContent: Text("3"),
                        badgeStyle: badges.BadgeStyle(
                        ),
                        child: Icon(Icons.notifications_none,
                          color: cubit.currentIndex == 3 ?
                          ColorManager.primaryColor : ColorManager.grayColor,
                          size:  Constans.getSize(context).width * .07,
                        ),
                      ),
                      Text("Notification",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        color:  cubit.currentIndex == 3 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: (){
                    cubit.changeBottomNavBar(index: 4);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: Constans.getSize(context).height *.005,
                    children: [
                      cubit.currentIndex == 4 ?  lineOnItemSelect(context) : Container(),

                      SvgPicture.asset(AssetsManager.settingIcon,
                        color:  cubit.currentIndex == 4 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                        width: Constans.getSize(context).width * .07,
                      ),
                      Text("Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        color:  cubit.currentIndex == 4 ?
                        ColorManager.primaryColor : ColorManager.grayColor,
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )


      // BottomNavigationBar(
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.red,
      //   items: cubit.item,
      //   onTap: (index) {
      //     HomeCubit.get(context)
      //         .changeBottomNavBar(index: index);
      //   },
      //   currentIndex: cubit.currentIndex,
      // ),

    );
  },
),
);
  }

  Widget lineOnItemSelect(BuildContext context) => Container(
    height: Constans.getSize(context).height * .008,
    decoration: BoxDecoration(
      color: ColorManager.primaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),

      )
    ),
  );
}
