import 'dart:developer';
import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/shared/local/cache_helper.dart';
import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/firebase_options.dart';
import 'package:ecomerce/views/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_service/firebase_notification.dart';
import 'firebase_service/local_notification.dart';


Future<void> main() async{
  //بيتاكد ان كل حاجه في ميثود خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseNotifications().init(); // يتم استدعاؤه مرة واحدة
  await LocalNotifications().init();

  var fcmToken =  FirebaseNotifications().token;
  log("FCM Token $fcmToken");

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