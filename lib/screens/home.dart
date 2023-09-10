// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ethelweard95/controllers/navcontroller.dart';
import 'package:ethelweard95/screens/screen1.dart';
import 'package:ethelweard95/screens/screen2.dart';
import 'package:ethelweard95/screens/screen5.dart';
import 'package:flutter/material.dart';

import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'screen7.dart';

PageController pageCont = PageController(initialPage: 0);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: MainScreenDecider(),
      //bottomNavigationBar: NavBar(),
    );
  }
}

class MainScreenDecider extends StatelessWidget {
  const MainScreenDecider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (Get.find<NavController>().navIndex.value) {
          case 2:
            return const ScreenFive();
          default:
            return const ScreenOne();
        }
      },
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late NavController navCont;
  @override
  void initState() {
    navCont = Get.find<NavController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(
            top: navCont.navIndex.value == 2 ? 1 : 0, bottom: 3),
        height: context.height * 0.1,
        width: context.width,
        color: navCont.navIndex.value == 2
            ? AppColors.white
            : AppColors.black.withOpacity(0.3),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavItem(
              title: 'Home',
              iconPath: 'assets/home.png',
              isSelected: navCont.navIndex.value == 0,
              onPressed: () {
                navCont.setNav(0);
              },
            ),
            NavItem(
              title: 'Explore',
              iconPath: 'assets/explore.png',
              isSelected: navCont.navIndex.value == 1,
              onPressed: () {
                navCont.setNav(1);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScreenSeven();
                  },
                ));
              },
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return const ScreenTwo();
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  backgroundColor: AppColors.skyBlue,
                  radius: 25,
                  child: Icon(Icons.add, color: AppColors.white, size: 30),
                ),
              ),
            ),
            NavItem(
              title: 'Plan',
              iconPath: 'assets/plan.png',
              isSelected: navCont.navIndex.value == 2,
              onPressed: () {
                navCont.setNav(2);
              },
            ),
            NavItem(
              title: 'Profile',
              iconPath: 'assets/person.png',
              isSelected: navCont.navIndex.value == 3,
              onPressed: () {
                navCont.setNav(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onPressed;
  const NavItem({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 32,
            height: 2,
            color: isSelected ? AppColors.skyBlue : Colors.transparent,
          ),
          Image.asset(
            iconPath,
            height: 27,
            width: 27,
            fit: BoxFit.cover,
            color: isSelected ? AppColors.skyBlue : AppColors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              title,
              style: context.normal10.copyWith(
                color: isSelected ? AppColors.skyBlue : AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
