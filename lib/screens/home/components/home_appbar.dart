import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/controller/controller_cart.dart';

AppBar appbarCustom() {
  return AppBar(
    backgroundColor: primaryWhite,
    elevation: 0,
    toolbarHeight: 70,
    titleTextStyle: const TextStyle(
      fontSize: 14,
    ),
    automaticallyImplyLeading: false,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Welcome back",
            style: TextStyle(
              color: Colors.black,
            )),
        SizedBox(
          height: 2,
        ),
        Text(
          "Samantha williams",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "PB",
            fontSize: 15,
          ),
        ),
      ],
    ),
    actions: [
      GestureDetector(
        onTap: () {
          Get.toNamed("/cartStore");
        },
        child: Container(
          margin: EdgeInsets.only(right: defauldPadding, top: 8, bottom: 8),
          width: 60,
          height: 60,
          color: Colors.transparent,
          child: Stack(
            children: [
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.local_grocery_store,
                  color: Colors.black,
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: GetBuilder<ControllerCart>(builder: (value) {
                    return value.cart.isEmpty
                        ? const SizedBox(width: 0, height: 0)
                        : Container(
                            decoration: BoxDecoration(
                              color: primaryOrange,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              value.cart.length.toString(),
                              style: TextStyle(
                                color: primaryWhite,
                                fontSize: 12,
                              ),
                            ),
                          );
                  }))
            ],
          ),
        ),
      )
    ],
  );
}
