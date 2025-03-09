import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/views/screens/on_boarding_screens/widgets/on_boarding_wiget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int indexPage = 0;

  PageController? _controller;


  @override
  void initState() {
   _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
            controller: _controller,
            children: [
              OnBoardingWidget(
                image: AssetsManager.onBoardingOneImage,
                title: StringsManager.onBoardingTitleOneText,
                subTitle:  StringsManager.onBoardingSubTitleOneText,
                activeIndex: indexPage,
                onTapPrevious: () {  },
                onTapNext: () {
                  setState(() {
                    _controller!.animateToPage(
                        indexPage +1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear
                        //https://api.flutter.dev/flutter/animation/Curves-class.html
                    );
                  });
                },
              ),
              OnBoardingWidget(
                image: AssetsManager.onBoardingTwoImage,
                title: StringsManager.onBoardingTitleTwoText,
                activeIndex: indexPage,
                onTapPrevious: () {
                  _controller!.animateToPage(
                      indexPage -1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                  );
                },
                onTapNext: () {
                  setState(() {
                    _controller!.animateToPage(
                        indexPage +1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear
                    );
                  });
                },
                subTitle:  StringsManager.onBoardingSubTitleTwoText,),
              OnBoardingWidget(
                image: AssetsManager.onBoardingThreeImage,
                title: StringsManager.onBoardingTitleThreeText,
                activeIndex: indexPage,
                subTitle:  StringsManager.onBoardingSubTitleThreeText,
              ),
            ],
            onPageChanged: (newVal){
              setState(() {
                indexPage = newVal;
              });
            },
          )
      ),
    );
  }
}


/*
 setState(() {
                    _controller!.animateToPage(
                    indexPage + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  });
 */