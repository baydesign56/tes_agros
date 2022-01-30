import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/controller/controller_products.dart';

import 'components/home_appbar.dart';
import 'components/home_group_category.dart';
import 'components/list_products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String namePage = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode fSearch = FocusNode();

  Widget widgetSearch() {
    return Flexible(
      child: Container(
        // margin: EdgeInsets.all(defauldPadding),
        constraints: BoxConstraints(
          maxHeight: Get.width / 2,
        ),
        decoration: BoxDecoration(
          color: primaryInnerColor,
          borderRadius: BorderRadiusDirectional.circular(500),
        ),
        height: 40,
        padding: const EdgeInsets.all(1),
        child: TextField(
          onChanged: (v) {
            controllerProducts.query(
              isSearch: true,
              param: v,
            );
          },
          focusNode: fSearch,
          style: const TextStyle(
            fontSize: 13,
          ),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            contentPadding: EdgeInsets.only(top: 5),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  ControllerProducts controllerProducts = Get.put(ControllerProducts());

  @override
  void initState() {
    super.initState();
    controllerProducts.getProducts();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          fSearch.unfocus();
        });
      },
      child: Scaffold(
        appBar: appbarCustom(),
        backgroundColor: primaryWhite,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: defauldPadding,
            ),
            const HomeGroupCategory(),
            SizedBox(
              height: defauldPadding,
            ),
            Padding(
              padding: EdgeInsets.all(defauldPadding),
              child: Row(
                children: [
                  widgetSearch(),
                  SizedBox(
                    width: defauldPadding,
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: primaryInnerColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.filter_alt_rounded,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(7.5),
              child: ListProducts(),
            )
          ],
        )),
      ),
    );
  }
}
