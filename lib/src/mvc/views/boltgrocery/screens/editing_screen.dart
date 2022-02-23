import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/controllers/editing_controller.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/category.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/grocery_item.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/design_elements/bottom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditingScreen extends StatelessWidget {
  EditingScreen({Key? key, GroceryItem? groceryItem, Category? category})
      : super(key: key) {
    if (groceryItem != null) {
      _editingController!.groceryItem = groceryItem;
    }
    _editingController!.category = category;
  }
  final EditingController? _editingController = Get.put(EditingController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Container(
              height: 130.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0))),
            ),
            Align(
              alignment: Alignment.center,
              child: EditingForm(),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: const EdgeInsets.only(top: 60.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Flexible(child: BackButton()),
                        Flexible(
                          flex: 4,
                          child: Text(
                            _editingController!.groceryItem != null
                                ? 'Edit Item'
                                : 'Add Item',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ))),
          ],
        ),
        bottomNavigationBar: BottomAppButton(
            label: 'Save Changes',
            icon: const Icon(Icons.done),
            onPressed: () {
              _editingController!.submitForm();
              if (_editingController!.formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            }),
      ),
    );
  }
}

class EditingForm extends StatelessWidget {
  final EditingController? _editingController = Get.find();

  EditingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Form(
            key: _editingController!.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                13.0, 2.0, 13.0, 10.0),
                            child: TextFormField(
                              validator: _editingController!.textFieldValidator,
                              controller:
                                  _editingController!.itemNameController,
                              cursorColor: Colors.green[400],
                              autofocus: true,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Item Name',
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.green[400]!,
                                  width: 2,
                                )),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.green[400]!,
                                  width: 2,
                                )),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                              ),
                              textCapitalization: TextCapitalization.words,
                            ),
                          ),
                          ItemNameChips()
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  13.0, 0.0, 13.0, 10.0),
                              child: TextFormField(
                                validator: _editingController!
                                    .textFieldValidator, // Only numbers can be entered,
                                controller: _editingController!
                                    .quantityEditingController,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.green[400],
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.green[400]!,
                                    width: 2,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.green[400]!,
                                    width: 2,
                                  )),
                                  hintText: 'Quantity',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child:
                          UnitDropDown(editingController: _editingController),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemNameChips extends StatelessWidget {
  ItemNameChips({
    Key? key,
  }) : super(key: key);

  final EditingController? _editingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: GetBuilder<ThemeController>(builder: (_themeController) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _editingController!.category!.nameOptions?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: _themeController.themeMode == ThemeMode.dark
                          ? Colors.grey[700]
                          : Colors.white),
                  child: InkWell(
                    customBorder: const RoundedRectangleBorder(),
                    onTap: () => _editingController!.chipSelection(index),
                    child:
                        Text(_editingController!.category!.nameOptions![index]),
                  ),
                ),
              );
            });
      }),
    );
  }
}

class UnitDropDown extends StatelessWidget {
  const UnitDropDown({
    Key? key,
    required EditingController? editingController,
  })  : _editingController = editingController,
        super(key: key);

  final EditingController? _editingController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(13.0, 6.0, 13.0, 4.0),
            child: Obx(() {
              return DropdownButton<String>(
                underline: Container(
                  height: 2,
                  color: Colors.green[400],
                ),
                isExpanded: true,
                value: _editingController!.unit!.value,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                onChanged: _editingController!.changeUnit,
                items: _editingController!.dropDownValues
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
