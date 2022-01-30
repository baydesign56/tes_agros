import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tes_agros/components/button_primary.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/countering.dart';
import 'package:tes_agros/controller/controller_cart.dart';
import 'package:tes_agros/models/model_cart.dart';
import 'package:tes_agros/models/model_list_products.dart';

import 'components/image_products.dart';

class DetailProducts extends StatefulWidget {
  const DetailProducts({
    Key? key,
  }) : super(key: key);

  static String namePage = "/detailProducts";

  @override
  _DetailProductsState createState() => _DetailProductsState();
}

class _DetailProductsState extends State<DetailProducts> {
  ControllerCart controllerCart = Get.put(ControllerCart());
  Result produc = Get.arguments;

  int totalItems = 1;

  Widget buttonCircle({IconData? iconData}) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: primaryInnerColor,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Icon(
        iconData,
        color: Colors.black,
      )),
    );
  }

  Widget titleProduct() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: Text(produc.name!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "PB",
                  )),
            ),
            Countering(
              value: totalItems,
              onTap: (v) {
                log(v.toString());
                setState(() {
                  totalItems = v;
                });
              },
            )
          ]),
          SizedBox(
            height: defauldPadding,
          ),
          Text(
            produc.episode!.toList().toString(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: buttonCircle(
                  iconData: Icons.arrow_back_ios_new_rounded,
                ),
              ),
              buttonCircle(
                iconData: Icons.bookmark,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageProducts(urlImage: produc.image),
            titleProduct(),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          controllerCart.addCart(ModelCart(
            name: produc.name,
            locationName: produc.location!.name,
            desk: produc.gender! + " " + produc.species! + " " + produc.status!,
            count: totalItems,
            imageUrl: produc.image,
          ));
          Get.back();
          Get.rawSnackbar(
            message: "Ditambah kekeranjang",
            backgroundColor: primaryOrange,
            duration: const Duration(seconds: 2),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(defauldPadding),
          child: SizedBox(
            height: 45,
            child: buttonPrimary(
              color: totalItems <= 0 ? Colors.grey : null,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.local_grocery_store_rounded, color: Colors.white),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PB",
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
