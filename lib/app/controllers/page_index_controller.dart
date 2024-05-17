import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    switch (index) {
      case 0:
        currentIndex.value = index;
        Get.offAllNamed('/home');
      case 1:
        currentIndex.value = index;
        Get.offAllNamed('/map');
      case 2:
        currentIndex.value = index;
        Get.offAllNamed('/contact');
      case 3:
        currentIndex.value = index;
        Get.offAllNamed('/media');
      case 4:
        currentIndex.value = index;
        Get.offAllNamed('/data');
      default:
        Get.offAllNamed('/home');
    }
  }
}
