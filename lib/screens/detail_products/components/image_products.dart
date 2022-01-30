import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';

Widget imageProducts({String? urlImage, String? price}) {
  return Padding(
    padding: EdgeInsets.all(defauldPadding),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(defauldRadius),
      child: Container(
        width: Get.width,
        height: Get.width + 30,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(defauldRadius),
        ),
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.network(
                urlImage ?? "",
                fit: BoxFit.cover,
              )),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: const Text("1/KG D10",
                  style: TextStyle(
                    fontFamily: "PB",
                  )),
            ),
          )
        ]),
      ),
    ),
  );
}
