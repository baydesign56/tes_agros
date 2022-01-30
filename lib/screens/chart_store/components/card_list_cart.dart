import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/models/model_cart.dart';

import 'detail_list_cart.dart';

class CardListCart extends StatefulWidget {
  const CardListCart({Key? key, this.cart, this.index}) : super(key: key);
  final ModelCart? cart;
  final int? index;

  @override
  _CardListCartState createState() => _CardListCartState();
}

class _CardListCartState extends State<CardListCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheetCustom(widget.cart, widget.index!);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
        width: Get.width,
        padding: EdgeInsets.all(defauldPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: primaryOrange,
                shape: BoxShape.circle,
              ),
              child: Text(widget.cart!.count.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
