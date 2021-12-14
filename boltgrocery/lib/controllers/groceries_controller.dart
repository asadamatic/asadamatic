import 'package:boltgrocery/data_models/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class GroceriesController extends GetxController
    with SingleGetTickerProviderMixin {
  RxList<GroceryItem> groceries = <GroceryItem>[].obs;

  AnimationController? _animationController;
  Animation<RelativeRect>? animation;
  Brightness brightness = SchedulerBinding.instance!.window.platformBrightness;

  @override
  void onInit() async {
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward();
    animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, 100.0, 0.0, 0.0),
      end: RelativeRect.fromLTRB(0.0, 150.0, 0.0, 0.0),
    ).animate(_animationController!);

    super.onInit();
  }

  addNewItem(GroceryItem groceryItem) async{
    groceries.add(groceryItem);
    update();
  }
  updateItem(GroceryItem groceryItem) async{
    groceries[groceries.indexWhere((oldGroceryItem) => oldGroceryItem.id == groceryItem.id)] = groceryItem;
    update();
  }

  deleteItem(GroceryItem? groceryItem) async{
    groceries.removeWhere((oldGroceryItem) => oldGroceryItem.id == groceryItem!.id);
    update();
  }


  List<GroceryItem> groceriesList(String? category) {
    return groceries
        .where((groceryItem) => groceryItem.category == category)
        .toList();
  }
}
