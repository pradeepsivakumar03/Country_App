import 'package:flutter/material.dart';
import 'package:project1/jsons/city_json.dart';
import 'package:project1/models/city_model.dart';
import 'package:project1/models/state_model.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/city_tile_widget.dart';
import '../widgets/search_field.dart';

class CitiesScreen extends StatefulWidget {
  final StateModel stateModel;
  const CitiesScreen({super.key, required this.stateModel});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<CityModel> cityModelList = [];
  List<CityModel> filteredList = [];
  final cityController = TextEditingController();
  @override
  void initState() {
    final List<CityModel> rawDataList =
        cityJson.map((e) => CityModel.fromJson(e)).toList();
    cityModelList = rawDataList
        .where((e) => e.stateCode == widget.stateModel.stateCode)
        .toList();
    for (int i = 0; i < rawDataList.length; i++) {
      // if()
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.stateModel.state),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            searchWidget(
                title: "Search Cities",
                controller: cityController,
                onChanged: (value) {
                  filteredList.clear();
                  filteredList = cityModelList
                      .where((e) =>
                          e.city.toLowerCase().contains(value.toLowerCase().trim())
                          )
                      .toList();
                   setState(() {
                   });
                  //  log(filteredList.toString());
                }),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: cityController.text.isNotEmpty
                      ? filteredList.length
                      : cityModelList.length,
                  itemBuilder: (context, index) {
                    final CityModel cityModel = cityController.text.isNotEmpty
                        ? filteredList[index]
                        : cityModelList[index];
                    return cityTileWidget(cityModel: cityModel);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
