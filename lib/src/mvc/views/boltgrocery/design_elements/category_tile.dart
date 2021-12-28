import 'package:asadamatic/src/mvc/views/boltgrocery/data_models/category.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  final Category? category;
  const CategoryTile({Key? key, this.category}) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16.5, 10.0, 10.0, 16.5),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.width * .2,
              image:
                  AssetImage(widget.category!.image!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '${widget.category!.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CategoryScreen(
                      category: widget.category,
                    )));
        // Get.to(() => CategoryScreen(
        //       category: widget.category,
        //     ));
      },
    );
  }
}
