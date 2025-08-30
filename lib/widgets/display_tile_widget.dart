import 'package:flutter/material.dart';
import 'package:project1/models/country_model.dart';

Widget countryTileWidget({required CountryModel countryModel}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: Colors.grey,
        )),
    padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(countryModel.country),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
              margin: const EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Text(
                countryModel.isoCode,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
          ],
        ),
        const Row(
              children: [
                Icon(
                  Icons.info,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.pink,
                )
              ],
            )
      ],
    ),
  );
}
