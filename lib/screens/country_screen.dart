import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project1/jsons/country_json.dart';
import 'package:project1/models/country_model.dart';
import 'package:project1/screens/state_screen.dart';
import 'package:project1/widgets/app_bar_widget.dart';
import 'package:project1/widgets/display_tile_widget.dart';
import '../widgets/search_field.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<CountryModel> countryModelList = [];
  List<CountryModel> filteredList = [];
  final contryController = TextEditingController();
  @override
  void initState() {
    countryModelList =
        countryJson.map((e) => CountryModel.fromJson(e)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Countries"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            searchWidget(
                title: "Search Country",
                controller: contryController,
                onChanged: (value)async {
                  filteredList.clear();
                      for(int i=0;i<countryModelList.length;i++){
                        if(countryModelList[i].isoCode.toLowerCase().contains(value.toLowerCase().trim())){
                          log(countryModelList[i].isoCode);
                          filteredList.add(countryModelList[i]);
                        }
                      }
                   setState(() {
                   });
                   log(filteredList.toString());
                }),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: contryController.text.isNotEmpty
                      ? filteredList.length
                      : countryModelList.length,
                  itemBuilder: (context, index) {
                    final CountryModel countryModel =
                        contryController.text.isNotEmpty
                            ? filteredList[index]
                            : countryModelList[index];
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StateScreen(
                                      countryModel: countryModel,
                                    ))),
                        child: countryTileWidget(countryModel: countryModel));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
