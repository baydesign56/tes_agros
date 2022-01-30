import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/controller/controller_products.dart';
import 'package:tes_agros/screens/home/components/widget_button_category.dart';

class HomeGroupCategory extends StatefulWidget {
  const HomeGroupCategory({Key? key}) : super(key: key);

  @override
  _HomeGroupCategoryState createState() => _HomeGroupCategoryState();
}

class _HomeGroupCategoryState extends State<HomeGroupCategory> {
  int index = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GetBuilder<ControllerProducts>(builder: (value) {
        return Row(
          children: [
            SizedBox(
              width: defauldPadding,
            ),
            if (value.load || value.errorMessage != null)
              for (var i = 0; i < 6; i++) widgetButtonCategory()
            else
              for (var i = -1; i < value.category.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = i;
                    });
                    i == -1
                        ? value.query(
                            isSearch: false,
                            param: null,
                          )
                        : value.query(
                            isSearch: false,
                            param: value.category[i],
                          );
                  },
                  child: widgetButtonCategory(
                    isIndex: i == index ? true : false,
                    name: i == -1 ? "All" : value.category[i],
                  ),
                )
          ],
        );
      }),
    );
  }
}
