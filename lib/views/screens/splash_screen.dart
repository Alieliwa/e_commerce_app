import 'dart:async';

import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/views/screens/home_screens/home_layout.dart';
import 'package:ecomerce/views/screens/home_screens/home_screen.dart';
import 'package:ecomerce/views/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
        (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context)=>
                onBoarding == null ?
                OnBoardingScreen() :
                HomeLayout()
              ,),);
        }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.logoImage,
              width: width * .4,
              fit: BoxFit.cover,
            ),
            Text(
            StringsManager.jawdahText,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: ColorManager.primaryColor
              ),
            ),
            Text(
              StringsManager.findText,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                color: ColorManager.orangeColor
              ),
            ),
          ],
        ),
      ),

    );
  }
}
