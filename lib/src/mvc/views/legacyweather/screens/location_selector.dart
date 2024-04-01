import 'dart:convert';
import 'package:asadamatic/src/mvc/views/legacyweather/constants/values.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/controllers/weather_controller.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/data_models/city.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocationSelector extends StatefulWidget {
  final Function? selectScreen;
  const LocationSelector({Key? key, this.selectScreen}) : super(key: key);

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  Future<List<City>?>? future;
  List<City>? cities = [];
  List<City>? filteredList = [];
  TextEditingController searchController = TextEditingController();

  final WeatherController _weatherController = Get.find();

  void clearSearch() {
    setState(() {
      searchController.clear();
      filteredList = cities;
    });
  }

  void filterData(search) {
    setState(() {
      if (search.isEmpty) {
        filteredList = cities;
      } else {
        filteredList = cities;
        List<City> temporaryList = [];

        for (int index = 0; index < filteredList!.length; index++) {
          if (filteredList![index]
              .name!
              .toLowerCase()
              .contains(search.toLowerCase())) {
            temporaryList.add(filteredList![index]);
          }
        }
        filteredList = temporaryList;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = getCityList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Material(
            color: primaryColor,
            elevation: 2.0,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              padding: const EdgeInsets.only(bottom: 16.0),
              alignment: Alignment.bottomCenter,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Choose a Location',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.all(10.0),
                      elevation: 10.0,
                      child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 4.0, 12.0, 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                  hintText: 'Search for your city',
                                  border: InputBorder.none,
                                ),
                                onChanged: (queryText) {
                                  filterData(queryText);
                                },
                              ),
                            ),
                            InkWell(
                              child: Text(
                                'Clear',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.8),
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: .8),
                              ),
                              onTap: () {
                                clearSearch();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: filteredList?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return TextButton(
                              onPressed: () {
                                widget.selectScreen != null
                                    ? addCity(filteredList![index])
                                    : addNewCity(filteredList![index]);
                              },
                              child: Container(
                                child: Text(
                                    '${filteredList![index].name!}, ${filteredList![index].country!}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                                padding: const EdgeInsets.all(15.0),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }
              return const Center(
                  child: SizedBox(
                child: FlareActor(
                  "assets/legacyweather/WorldSpin.flr",
                  fit: BoxFit.contain,
                  animation: "roll",
                ),
                height: 200,
                width: 200,
              ));
            }),
      ),
    );
  }

  void addCity(City city) async {
    await _weatherController.addCity(city);
    widget.selectScreen!();
  }

  void addNewCity(City city) async {
    await _weatherController.addCity(city);
    Navigator.of(context).pop();
  }

  City fromJson(Map<String, dynamic> json) {
    return City(id: json['id'], name: json['name'], country: json['country']);
  }

  Future<List<City>?> getCityList() async {
    final response = await rootBundle.loadString(
      'assets/legacyweather/citylist.json',
    );
    final decoded = await customCompute(response);
    setState(() {
      cities = decoded.map<City>((json) => fromJson(json)).toList();
      filteredList = decoded.map<City>((json) => fromJson(json)).toList();
    });
    return decoded.map<City>((json) => fromJson(json)).toList();
  }

  customCompute(String response) async {
    return await compute(jsonDecode, response);
  }
}
