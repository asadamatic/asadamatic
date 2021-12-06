

import 'package:get/get.dart';

class OsController extends GetxController{

  final index = 0.obs;

  onOsChanged(newIndex){
    index.value = newIndex;
    update();
  }
}