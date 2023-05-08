import 'package:get/state_manager.dart';

class CountGetxController extends GetxController {
  RxInt count = 0.obs;

  void addCount() {
    count(count.value + 1);
  }

  void substractCount() {
    count(count.value - 1);
  }
}
