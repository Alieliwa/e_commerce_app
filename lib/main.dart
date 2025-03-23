import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/cubit/category_cubit/category_cubit.dart';
import 'package:ecomerce/views/screens/aut_screens/screens/log_in_screen.dart';
import 'package:ecomerce/views/screens/home_screens/home_layout.dart';
import 'package:ecomerce/views/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:ecomerce/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

void main() {
  DioHelper.init();
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