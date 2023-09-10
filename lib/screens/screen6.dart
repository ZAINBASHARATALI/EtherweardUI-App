// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';

class ScreenSix extends StatelessWidget {
  final String bgImagePath;
  const ScreenSix({Key? key, required this.bgImagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            InnerShadow(
              color: AppColors.black.withOpacity(0.5),
              offset: const Offset(0, 200),
              blur: 150,
              child: Hero(
                tag: bgImagePath.contains('world')
                    ? 'expandTop'
                    : 'expandBottom',
                child: Image.asset(
                  bgImagePath,
                  height: context.height,
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              height: context.height,
              width: context.width,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: context.width,
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/back.png', scale: 3),
                    ),
                  ),
                  const Spacer(),
                  Text('Build your trip', style: context.bold32),
                  const Spacer(flex: 6),
                  TripCard(
                    onTap: () {},
                    title: 'Do it yourself',
                    imagePath: 'assets/equipment.jpeg',
                  ),
                  const SizedBox(height: 30),
                  TripCard(
                    onTap: () {},
                    title: 'AI generation',
                    imagePath: 'assets/ai.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  const TripCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width,
        height: context.height * 0.2,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 10,
            ),
          ],
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.fitWidth, opacity: 0.7),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(title, style: context.bold20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
