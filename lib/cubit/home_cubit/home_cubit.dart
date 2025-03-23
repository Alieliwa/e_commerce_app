import 'package:bloc/bloc.dart';
import 'package:ecomerce/views/screens/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);


  List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'الرئيسية'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: 'الرئيسية'),
    BottomNavigationBarItem(icon: Icon(Icons.category),label: 'الرئيسية'),
    BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'الرئيسية'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'الرئيسية'),
  ];

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    Container(child: Center(child: Text("Cart Screen"),),),
    Container(child: Center(child: Text("Category Screen"),),),
    Container(child: Center(child: Text("Notification Screen"),),),
    Container(child: Center(child: Text("Setting Screen"),),),
  ];

  void changeBottomNavBar({required int index})
  {
    currentIndex = index;
    emit(ChangeBottomNavigationBar());
  }



}
