import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';

Widget buttonPrimary({required Widget title, Color? color}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: defauldPadding),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(defauldRadius),
      color: color ?? primaryOrange,
    ),
    child: Center(child: title),
  );
}
