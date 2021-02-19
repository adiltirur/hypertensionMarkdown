import 'package:get/get.dart';

class LibraryControllerMain extends GetxController {
  var currentSegment = 0.obs;
  final isLoading = true.obs;
  final newVal = true.obs;
  final search = false.obs;

  void updateSegment(number) {
    currentSegment.update((val) {
      currentSegment = number;
    });
    update();
  }

  void loaded() {
    isLoading.toggle();
    update();
  }

  void newItem() {
    newVal.toggle();
    update();
  }

  void searchToggle() {
    search.toggle();
    update();
  }
}
