import 'package:ethelweard95/screens/home.dart';
import 'package:ethelweard95/screens/screen6.dart';
import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class ScreenFive extends StatelessWidget {
  const ScreenFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Hero(
            tag: 'expandTop',
            child: SwipeDetector(
              onSwipeUp: (offset) {
                if (offset.dy <= 50.0) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ScreenSix(bgImagePath: 'assets/world.jpg');
                    },
                  ));
                }
              },
              child: InnerShadow(
                color: AppColors.black.withOpacity(0.5),
                offset: const Offset(0, 30),
                blur: 50,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  width: context.width,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/world.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Build your trip', style: context.bold20),
                      const SizedBox(height: 20),
                      Image.asset('assets/up.png', scale: 2.7),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Hero(
            tag: 'expandBottom',
            child: SwipeDetector(
              onSwipeDown: (offset) {
                if (offset.dy >= 50.0) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ScreenSix(bgImagePath: 'assets/place.jpg');
                    },
                  ));
                }
              },
              child: InnerShadow(
                color: AppColors.black.withOpacity(0.5),
                offset: const Offset(0, 30),
                blur: 50,
                child: Container(
                  //height: context.height * 0.455,
                  padding: const EdgeInsets.only(top: 30),
                  width: context.width,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/place.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/down.png', scale: 2.7),
                      const SizedBox(height: 20),
                      Text('On-site plan', style: context.bold20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const NavBar(),
      ],
    );
  }
}
