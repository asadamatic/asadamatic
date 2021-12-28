import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroceriesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<GroceryItem> groceries = <GroceryItem>[].obs;

  AnimationController? _animationController;
  Animation<RelativeRect>? animation;

  @override
  void onInit() async {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    animation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0.0, 100.0, 0.0, 0.0),
      end: const RelativeRect.fromLTRB(0.0, 150.0, 0.0, 0.0),
    ).animate(_animationController!);

    super.onInit();
  }

  addNewItem(GroceryItem groceryItem) async {
    groceries.add(groceryItem);
    update();
  }

  updateItem(GroceryItem groceryItem) async {
    groceries[groceries.indexWhere(
        (oldGroceryItem) => oldGroceryItem.id == groceryItem.id)] = groceryItem;
    update();
  }

  deleteItem(GroceryItem? groceryItem) async {
    groceries
        .removeWhere((oldGroceryItem) => oldGroceryItem.id == groceryItem!.id);
    update();
  }

  List<GroceryItem> groceriesList(String? category) {
    return groceries
        .where((groceryItem) => groceryItem.category == category)
        .toList();
  }
}
