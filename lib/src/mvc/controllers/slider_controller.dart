

import 'package:get/get.dart';

class SliderController extends GetxController{

  final index = 0.obs;

  onPageChanged(newIndex){
    index.value = newIndex;
  }
}