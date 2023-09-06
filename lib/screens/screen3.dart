// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ethelweard95/screens/screen4.dart';
import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';

class ScreenThree extends StatelessWidget {
  final PageController pageCont;
  const ScreenThree({Key? key, required this.pageCont}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/back.png',
                    scale: 3,
                    color: AppColors.black,
                  ),
                  onTap: () => pageCont.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset('assets/profilepic.png', scale: 1.5),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@RebeccaWilson',
                          style: context.regular14
                              .copyWith(color: AppColors.black),
                        ),
                        Text(
                          'Venice, Egypt',
                          style: context.regular10.copyWith(
                            color: AppColors.black.withOpacity(0.4),
                            height: 1.5,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Venice, often referred to as the "Floating City," is a captivating and unique destination located in north-eastern Italy. Built on a network of 118 small islands in the Venetian Lagoon, it is renowned for its enchanting canals and elegant bridges',
                  style: context.regular12
                      .copyWith(color: AppColors.black, height: 1.35),
                ),
                const SizedBox(height: 10),
                Text(
                  '#venice  #canal  #bridges  #serene',
                  style: context.regular12
                      .copyWith(color: AppColors.skyBlue, height: 1),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.topCenter,
                  width: context.width,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    options: CarouselOptions(
                      //height: context.width * 0.85,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return CarouselItem(
                        imagePath: 'assets/venice.jpg',
                        length: 3,
                        index: index,
                        onExpandClick: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ScreenFour();
                            },
                          ));
                        },
                      );
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite_outline_sharp),
                    const SizedBox(width: 15),
                    const Icon(Icons.ios_share_outlined),
                    const SizedBox(width: 15),
                    const Icon(Icons.copy),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'View Map',
                        style: context.regular12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          color: AppColors.black,
          width: context.width,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/star.png',
                scale: 3,
              ),
              const SizedBox(width: 3),
              Image.asset(
                'assets/star.png',
                scale: 3,
              ),
              const SizedBox(width: 3),
              Image.asset(
                'assets/star.png',
                scale: 3,
              ),
              const SizedBox(width: 30),
              Text('812 Reviews (Only for Ads)', style: context.regular12),
            ],
          ),
        ),
      ],
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final int length;
  final int index;
  final VoidCallback onExpandClick;
  const CarouselItem({
    Key? key,
    required this.imagePath,
    required this.length,
    required this.index,
    required this.onExpandClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'heroTag',
      child: Container(
        padding: const EdgeInsets.all(10),
        width: context.width,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                color: AppColors.black.withOpacity(0.5),
              ),
              child: Text(
                '${index + 1}/$length',
                style: context.regular12.copyWith(letterSpacing: 1),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                    radius: 15, backgroundColor: Colors.transparent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(length, (index) => index)
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: index == e
                                ? AppColors.white
                                : AppColors.lightGrey.withOpacity(0.6),
                          ),
                        ),
                      )
                      .toList(),
                ),
                GestureDetector(
                  onTap: onExpandClick,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.black.withOpacity(0.5),
                    child: Image.asset('assets/expand.png', scale: 2.8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
