import 'package:boltgrocery/data_models/category.dart';
import 'package:boltgrocery/data_models/grocery_item.dart';
import 'package:boltgrocery/design_elements/bottom_app_button.dart';
import 'package:boltgrocery/design_elements/grocery_item_card.dart';
import 'package:boltgrocery/Screens/editing_screen.dart';
import 'package:boltgrocery/controllers/groceries_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final GroceryItem? groceryItem;
  final Category? category;
  CategoryScreen({this.groceryItem, this.category});

  //String to bool conversion
  bool getStatus(String value) {
    return value == 'true' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
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
              Positioned(
                top: 145.0,
                right: 0.0,
                left: 0.0,
                height: MediaQuery.of(context).size.height * 0.7,
                child:
                    GetBuilder<GroceriesController>(builder: (_homeController) {
                  final groceryItemList =
                      _homeController.groceriesList(category!.slug);
                  return Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: ListView.builder(
                      itemCount: groceryItemList.length,
                      itemBuilder: (context, index) {
                        return GroceryItemCard(
                          key: UniqueKey(),
                          groceryItem: groceryItemList[index],
                          category: category,
                        );
                      },
                    ),
                  );
                }),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(top: 60.0, left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: BackButton()),
                          Flexible(
                            flex: 4,
                            child: Hero(
                              tag: '${category!.name!}Title',
                              child: Text(
                                category!.name!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      ))),
            ],
          ),
          bottomNavigationBar: BottomAppButton(
            label: 'Add New Item',
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EditingScreen(
                            category: category,
                          )));
              // Get.to(() => EditingScreen(
              //       category: category,
              //     ));
            },
          )),
    );
  }
}
