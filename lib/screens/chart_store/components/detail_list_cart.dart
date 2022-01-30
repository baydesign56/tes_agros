import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/button_primary.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/components/countering.dart';
import 'package:tes_agros/controller/controller_cart.dart';
import 'package:tes_agros/models/model_cart.dart';

showBottomSheetCustom(ModelCart? cart, int index) {
  Get.bottomSheet(
    DetailListCart(
      cart: cart!,
      index: index,
    ),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    barrierColor: Colors.transparent,
  );
}

class DetailListCart extends StatefulWidget {
  const DetailListCart({Key? key, this.cart, this.index}) : super(key: key);
  final ModelCart? cart;
  final int? index;

  @override
  _DetailListCartState createState() => _DetailListCartState();
}

class _DetailListCartState extends State<DetailListCart> {
  int totalItems = 0;
  ControllerCart controllerCart = Get.put(ControllerCart());
  @override
  void initState() {
    super.initState();
    totalItems = widget.cart!.count!;
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    controllerCart.deleteCart(widget.index!);
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(defauldPadding),
              height: 200,
              color: primaryWhite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.network(widget.cart!.imageUrl!,
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: defauldPadding,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.cart!.name!,
                              style: const TextStyle(
                                fontFamily: "PB",
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.cart!.locationName!,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.cart!.desk!,
                        ),
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
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      controllerCart.updateCart(
                          index: widget.index!, count: totalItems);
                      Get.back();
                    },
                    child: buttonPrimary(
                      title: const Text(
                        "Simpan",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PB",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
