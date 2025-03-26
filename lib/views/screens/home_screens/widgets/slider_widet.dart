import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
   SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  List<String> sliderList = [
    AssetsManager.sliderImage,
   "assets/images/imageslider-1-780x410.png",
    AssetsManager.sliderImage,
    AssetsManager.sliderImage,
  ];
  bool autoPlay = true;


  int _currentIndex = 0;
  @override
  void dispose() {
    autoPlay = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: sliderList.map((image) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.asset(image,),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: Constans.getSize(context).height * .2,
            autoPlay: autoPlay,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {

              });
              _currentIndex = index;
            },
          ),
        ),
        SizedBox(
          height: Constans.getSize(context).height  * .03,
          child: AnimatedSmoothIndicator(
            count: sliderList.length,
            axisDirection: Axis.horizontal,
            effect: WormEffect(
              dotColor: ColorManager.grayColor,
              activeDotColor: ColorManager.primaryColor,
              dotWidth: Constans.getSize(context).width  * .025,
              dotHeight: Constans.getSize(context).height  * .012,
            ),
            activeIndex: _currentIndex,
          ),
        ),
      ],
    );
  }
}
