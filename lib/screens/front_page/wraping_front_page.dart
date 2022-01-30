import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/controller/controller_cart.dart';
import 'package:tes_agros/screens/home/home.dart';

import 'components/front_page.dart';

class WrapingFrontPage extends StatefulWidget {
  const WrapingFrontPage({Key? key}) : super(key: key);
  static String namePage = "/wraping_front_page";

  @override
  _WrapingFrontPageState createState() => _WrapingFrontPageState();
}

class _WrapingFrontPageState extends State<WrapingFrontPage> {
  PageController controller = PageController(initialPage: 0, keepPage: true);
  ControllerCart controllerCart = Get.put(ControllerCart());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: PageView(
        controller: controller,
        children: [
          FrontPage(
            imageAssets: "assets/images/pexels-mark-stebnicki-2255935.jpg",
            firstTitle: "Affordable",
            secondTitle: "Prices",
            titleButton: "NEXT",
            titleContent: "affordable price for all people",
            functionToPage: (v) {
              setState(() {
                controller.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              });
            },
          ),
          FrontPage(
            imageAssets: "assets/images/pexels-mark-stebnicki-2252584.jpg",
            firstTitle: "from",
            secondTitle: "Farmer",
            titleButton: "NEXT",
            titleContent: "Help small businesses grow",
            functionToPage: (v) {
              setState(() {
                controller.animateToPage(2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              });
            },
          ),
          FrontPage(
            imageAssets: "assets/images/pexels-mark-stebnicki-2255920.jpg",
            firstTitle: "Digital",
            secondTitle: "Grocery Store",
            titleButton: "SHOP NOW",
            titleContent: "The most complete and cheap\ngrocery store",
            functionToPage: (v) {
              Get.toNamed(Home.namePage);
            },
          ),
        ],
      ),
    );
  }
}
