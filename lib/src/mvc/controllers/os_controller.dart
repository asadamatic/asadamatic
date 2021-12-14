import 'package:get/get.dart';

class OsController extends GetxController {
  final index = 0.obs;
  final hover = false.obs;
  final hoverIndex = 0.obs;
  onOsChanged(newIndex) {
    index.value = newIndex;
    update();
  }

  onHover(bool value, int newIndex) {
    if (value) {
      if (newIndex != index.value) {
        hover.value = true;
        hoverIndex.value = newIndex;
      } else {
        hover.value = false;
      }
    } else {
      hover.value = false;
    }

    update();
  }
}
