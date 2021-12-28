import 'package:asadamatic/src/mvc/views/boltgrocery/controllers/groceries_controller.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/category.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/grocery_item.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/screens/editing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroceryItemCard extends StatefulWidget {
  final GroceryItem? groceryItem;
  final Category? category;
  const GroceryItemCard({Key? key, this.groceryItem, this.category}) : super(key: key);

  @override
  State createState() {
    return GroceryItemCardState();
  }
}

class GroceryItemCardState extends State<GroceryItemCard> {
  final GroceriesController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.fromLTRB(12.0, 2.5, 12.0, 2.5),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              value: widget.groceryItem!.status,
              onChanged: (newValue) async {
                setState(() {
                  widget.groceryItem!.status = newValue;
                });
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 12.0, 8.0),
                    child: Text(
                      '${widget.groceryItem!.name}',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Text('${widget.groceryItem!.quantity} ',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        Flexible(
                            child: Text(
                                widget.groceryItem!.unit == 'Unit' ||
                                        widget.groceryItem!.unit == 'None'
                                    ? ''
                                    : '${widget.groceryItem!.unit}',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
              onSelected: popupCallback,
              itemBuilder: (BuildContext context) {
                return {'Edit', 'Delete'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
    );
  }

  void popupCallback(String value) async {
    switch (value) {
      case 'Edit':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EditingScreen(
                      groceryItem: widget.groceryItem,
                      category: widget.category,
                    )));
        // Get.to(() =>  EditingScreen(
        //   groceryItem: widget.groceryItem,
        //   category: widget.category,));

        break;

      case 'Delete':
        _homeController.deleteItem(widget.groceryItem);
        break;
    }
  }
}
