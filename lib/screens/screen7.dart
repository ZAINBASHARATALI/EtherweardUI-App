import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';
import 'package:flutter/material.dart';

class ScreenSeven extends StatelessWidget {
  const ScreenSeven({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        height: context.height,
        width: context.width,
        decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
            image: AssetImage('assets/Paris.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/back.png',
                      scale: 3,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Image.asset('assets/dotted_border.png'),
              ],
            ),
            Positioned(
              top: context.height * 0.125,
              left: 10,
              child: const TripTagCard(
                title: 'Tour Eiffel',
                imagePath: 'assets/book.png',
              ),
            ),
            Positioned(
              top: context.height * 0.275,
              left: 25,
              child: const TripTagCard(
                title: 'Tour Eiffel',
                imagePath: 'assets/headphone.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripTagCard extends StatelessWidget {
  final String title;
  final String imagePath;
  const TripTagCard({Key? key, required this.title, required this.imagePath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imagePath, scale: 3),
          Text(title, style: context.normal16),
        ],
      ),
    );
  }
}
