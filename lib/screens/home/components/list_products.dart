import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/card_products.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/controller/controller_products.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerProducts>(builder: (value) {
      return Wrap(
        children: [
          for (var item in value.listProductsQuery)
            CardProducts(
              product: item,
            ),
          value.load
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.all(defauldPadding),
                  child: CircularProgressIndicator(
                    color: primaryOrange,
                  ),
                ))
              : GestureDetector(
                  onTap: () {
                    value.getProducts(
                      url: value.nextUrl,
                    );
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(7.5, 15, 7.5, 15),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: value.errorMessage == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text("Load more"),
                                  Icon(
                                    Icons.arrow_drop_down,
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  const Icon(
                                    Icons.warning,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text("Terjadi kesalahan "),
                                      SizedBox(
                                        width: defauldPadding,
                                      ),
                                    ],
                                  ),
                                  Text(value.errorMessage.toString()),
                                ],
                              ),
                      )),
                )
        ],
      );
    });
  }
}
