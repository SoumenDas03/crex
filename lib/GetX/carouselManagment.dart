import 'package:get/get.dart';

class firstCarouselSlider extends GetxController {
  RxDouble currentIndex = 0.0.obs;

  setCurrentIndex(double value) {
    currentIndex.value = value;
  }
}
