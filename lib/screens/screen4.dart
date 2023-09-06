// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ethelweard95/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:ethelweard95/utils/context.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  late final CarouselController carouselCont;
  @override
  void initState() {
    carouselCont = CarouselController();
    super.initState();
  }

  final List<String> images = [
    'assets/tajmahal.jpg',
    'assets/cathedral.jpg',
    'assets/venice.jpg',
    'assets/bigben.jpg',
  ];
  int selectedIndex = 2;
  String title = 'Taj Mahal, India';
  String description =
      'An immense mausoleum of white marble, built in Agra between 1631 and 1648 by order of the Mughal emperor';
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'heroTag',
      child: Scaffold(
        body: Container(
          width: context.width,
          height: context.height,
          color: AppColors.black,
          child: Stack(
            children: [
              InnerShadow(
                color: AppColors.black.withOpacity(0.5),
                offset: const Offset(0, 170),
                blur: 150,
                child: Image.asset(
                  images[selectedIndex],
                  height: context.height,
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: context.width,
                height: context.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      width: context.width,
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/back.png', scale: 3),
                      ),
                    ),
                    const Spacer(flex: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(title, style: context.bold24),
                          const SizedBox(height: 8),
                          Text(description, style: context.regular16)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CarouselSlider.builder(
                          carouselController: carouselCont,
                          itemCount: 4,
                          itemBuilder: (context, index, realIndex) {
                            return GestureDetector(
                              onTap: () {
                                carouselCont.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: CarouselCard(
                                imagePath: images[index],
                                isSelected: selectedIndex == index,
                              ),
                            );
                          },
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            height: 100,
                            viewportFraction: 0.3,
                            padEnds: false,
                            //enlargeCenterPage: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  const CarouselCard({
    Key? key,
    required this.imagePath,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: AppColors.black,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: isSelected ? AppColors.white : Colors.transparent,
        ),
      ),
    );
  }
}
