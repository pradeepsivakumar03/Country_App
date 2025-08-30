
import 'package:flutter/material.dart';
import 'package:project1/models/city_model.dart';

Widget cityTileWidget({required CityModel cityModel}){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: Colors.grey,
        )),
    padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(cityModel.city),
        const Icon(Icons.info,color: Colors.blue,)
      ],
    ),
  );
}

