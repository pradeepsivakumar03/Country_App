import 'package:flutter/material.dart';

Widget searchWidget(
    {required String title, required TextEditingController controller, required Function(String)? onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    controller: controller,
    maxLines: 1,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
      hintText: title,
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(7.0))),
  );
}
