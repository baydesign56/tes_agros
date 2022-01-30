import 'package:flutter/material.dart';
import 'package:tes_agros/components/constant.dart';

Widget widgetButtonCategory({bool? isIndex = false, String? name}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
    margin: EdgeInsets.only(right: defauldPadding - 5),
    decoration: BoxDecoration(
        color: primaryInnerColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
        )),
    child: Text(
      name ?? "    ",
      style: TextStyle(
        color: isIndex! ? Colors.black : Colors.grey.withOpacity(0.5),
      ),
    ),
  );
}
