import 'package:flutter/material.dart';
import 'package:project1/jsons/state_json.dart';
import 'package:project1/models/country_model.dart';
import 'package:project1/models/state_model.dart';
import 'package:project1/screens/cities_screen.dart';
import 'package:project1/widgets/state_tile_widget.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/search_field.dart';

class StateScreen extends StatefulWidget {
  final CountryModel countryModel;
  const StateScreen({super.key, required this.countryModel});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  List<StateModel> stateModelList = [];
  List<StateModel> filteredList = [];
  final stateController = TextEditingController();
  @override
  void initState() {
    final List<StateModel> rawDataList =
        stateJson.map((e) => StateModel.fromJson(e)).toList();
    stateModelList = rawDataList
        .where((e) => e.countryCode == widget.countryModel.isoCode)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.countryModel.country),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            searchWidget(
                title: "Search State",
                controller: stateController,
                onChanged: (value) {
                  filteredList.clear();
                  filteredList = stateModelList
                      .where((e) =>
                          e.stateCode.toLowerCase().contains(value.toLowerCase().trim())
                          )
                      .toList();
                  setState(() {});
                }),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: stateController.text.isNotEmpty
                      ? filteredList.length
                      : stateModelList.length,
                  itemBuilder: (context, index) {
                    final StateModel stateModel =
                        stateController.text.isNotEmpty
                            ? filteredList[index]
                            : stateModelList[index];
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CitiesScreen(
                                      stateModel: stateModel,
                                    ))),
                        child: stateTileWidget(stateModel: stateModel));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
