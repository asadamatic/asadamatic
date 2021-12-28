import 'package:asadamatic/src/mvc/views/boltgrocery/controllers/groceries_controller.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/category.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditingController extends GetxController {
  RxString? unit = 'Unit'.obs;
  List<String> dropDownValues = ['Unit', 'Kg', 'Litres', 'Dozen'];
  TextEditingController? itemNameController;
  TextEditingController? quantityEditingController;
  final GroceriesController _groceriesController = Get.find();
  Category? category;
  GroceryItem? groceryItem;
  final formKey = GlobalKey<FormState>();

  EditingController() {
    itemNameController = TextEditingController(text: groceryItem?.name ?? '');
    quantityEditingController =
        TextEditingController(text: groceryItem?.quantity ?? '');
    unit!.value = groceryItem?.unit ?? 'Unit';
  }
  changeUnit(String? newValue) {
    unit!.value = newValue!;
  }

  editItem() {
    groceryItem!.name = itemNameController!.text;
    groceryItem!.quantity = quantityEditingController!.text;
    groceryItem!.unit = unit!.value;
    _groceriesController.updateItem(groceryItem!);
  }

  addItem() {
    _groceriesController.addNewItem(GroceryItem(
        id: _groceriesController.groceries.length + 1,
        time: DateTime.now(),
        name: itemNameController!.text,
        quantity: quantityEditingController!.text.trim(),
        unit: unit!.value,
        category: category!.slug,
        status: false));
  }

  submitForm() {
    if (formKey.currentState!.validate()) {
      if (groceryItem != null) {
        editItem();
      } else {
        addItem();
      }
    }
  }

  String? textFieldValidator(String? value) {
    if (value!.isEmpty) {
      return 'Enter item quantity!';
    }
    return null;
  }

  chipSelection(int index) {
    itemNameController!.text = category!.nameOptions![index];
  }
}
