import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/shared/custom_text_form_field.dart';
import 'package:ecomerce/views/screens/home_screens/widgets/headers_item.dart';
import 'package:ecomerce/views/screens/home_screens/widgets/search_filter_widget.dart';
import 'package:ecomerce/views/screens/home_screens/widgets/slider_widet.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeadersItem(),
            SearchFilterWidget(),
            SizedBox(height: Constans.getSize(context).height *.02,),
            SliderWidget(),
          ],
        ),
      ),

    );
  }
}
