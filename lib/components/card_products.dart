import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/models/model_list_products.dart';

class CardProducts extends StatefulWidget {
  const CardProducts({Key? key, required this.product}) : super(key: key);
  final Result product;

  @override
  _CardProductsState createState() => _CardProductsState();
}

class _CardProductsState extends State<CardProducts> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/detailProducts", arguments: widget.product);
      },
      child: Container(
          width: Get.width / 2.3,
          // height: Get.width / 1.8,
          margin: const EdgeInsets.all(7.5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defauldRadius - 5),
            border: Border.all(
              color: primaryInnerColor,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defauldRadius - 5),
                    topRight: Radius.circular(defauldRadius - 5)),
                child: Container(
                  width: Get.width / 2.3,
                  height: (Get.width / 2) / 1.5,
                  color: Colors.grey,
                  child: Image.network(
                    widget.product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name ?? "-",
                        style: const TextStyle(
                          overflow: TextOverflow.clip,
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            child: Text(
                          "1 kg/ D 100",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        )),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: primaryOrange,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
