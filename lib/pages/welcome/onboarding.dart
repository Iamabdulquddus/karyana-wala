import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:karyana_wala/constants/styles.dart';

import '../../constants/images.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

final controller = PageController(
  initialPage: 0,
);
int currentPage = 0;
List<Widget> pages = [
  Column(
    children: [
      Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
        abdul,
        fit: BoxFit.cover,
      ),
            ),
          )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Set Your Delivery Location',
          style: MyTextStyles.sectionTitleSmallPrimary,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
  Column(
    children: [
      Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
        abdul,
        fit: BoxFit.cover,
      ),
            ),
          )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Set Your Delivery Location',
          style: MyTextStyles.sectionTitleSmallPrimary,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
  Column(
    children: [
      Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
        abdul,
        fit: BoxFit.cover,
      ),
            ),
          )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Set Your Delivery Location',
          style: MyTextStyles.sectionTitleSmallPrimary,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),

];

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            children: pages,
            onPageChanged: (index){
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: DotsIndicator(
            dotsCount: pages.length,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
      ],
    );
  }
}
