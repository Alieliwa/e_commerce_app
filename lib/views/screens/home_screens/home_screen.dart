import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/views/screens/home_screens/widgets/headers_item.dart';
import 'package:ecomerce/views/screens/home_screens/widgets/search_filter_widget.dart';
import 'package:ecomerce/views/screens/home_screens/widgets/slider_widet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/category_cubit/category_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CategoryCubit(),
        child: Column(
          children: [
            HeadersItem(),
            SearchFilterWidget(),
            SizedBox(height: Constans
                .getSize(context)
                .height * .02,),
            GestureDetector(
                onTap: (){
                  CategoryCubit().getCategoriesData();
                },
                child: SliderWidget()),

          ],
        ),
      ),
    );
  }
}
