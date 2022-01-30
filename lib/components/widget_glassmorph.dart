import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tes_agros/components/constant.dart';

Widget widgetGlassmorph({Widget? child}) {
  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
          // height: Get.height / 2.5,
          padding: EdgeInsets.all(defauldPadding * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.3),
          ),
          child: child),
    ),
  );
}
