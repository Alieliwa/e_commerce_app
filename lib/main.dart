import 'dart:developer';

import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/shared/local/cache_helper.dart';
import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';


Future<void> main() async{
  //بيتاكد ان كل حاجه في ميثود خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
//token: T9m7pxshw6bMNSs5BE6EDYYEtusxL2fHCBzdalwIWlXtOmNGaZ0a9UV9wyzbBRX3c1c3IF
  log(" bool onBoarding  $onBoarding");
  log(" token For User  $token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.whiteColor
      ),
      home: SplashScreen(),
    );
  }
}