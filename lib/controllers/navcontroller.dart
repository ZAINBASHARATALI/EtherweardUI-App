import 'package:get/get.dart';

class NavController extends GetxController {
  RxInt navIndex = 0.obs;

  void setNav(int val) {
    navIndex.value = val;
  }
}
