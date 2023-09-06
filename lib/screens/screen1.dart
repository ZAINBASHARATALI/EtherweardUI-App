import 'package:ethelweard95/screens/home.dart';
import 'package:ethelweard95/screens/screen3.dart';
import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';
import 'package:ethelweard95/widgets/filteritem.dart';
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.9,
      width: context.width,
      color: AppColors.black,
      child: Stack(
        children: [
          InnerShadow(
            color: AppColors.black.withOpacity(0.5),
            offset: const Offset(0, 150),
            blur: 150,
            child: Image.asset(
              'assets/venice.jpg',
              width: context.width,
              height: context.height,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: context.width,
            height: context.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.filter_alt_outlined, color: AppColors.white),
                      SizedBox(width: 10),
                      FilterItem(title: 'Popular'),
                      FilterItem(title: 'Nearby'),
                      FilterItem(title: 'For You'),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.8,
                  width: context.width,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageCont,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Venice, Italy',
                                          style: context.bold24),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/profilepic.png',
                                              scale: 2.85),
                                          Text('@RebeccaWilson',
                                              style: context.regular14),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.favorite_outline,
                                      color: AppColors.white,
                                      size: 27,
                                    ),
                                    Text('1.4M', style: context.regular10),
                                    const SizedBox(height: 20),
                                    const Icon(
                                      Icons.ios_share_outlined,
                                      color: AppColors.white,
                                      size: 25,
                                    ),
                                    const SizedBox(height: 20),
                                    const Icon(
                                      Icons.copy_outlined,
                                      color: AppColors.white,
                                      size: 25,
                                    ),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        pageCont.animateToPage(1,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.linear);
                                      },
                                      child: Container(
                                        height: 38,
                                        width: 38,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text('Flip!'),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.height * 0.035),
                          //const NavBar(),
                        ],
                      ),
                      ScreenThree(pageCont: pageCont),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
