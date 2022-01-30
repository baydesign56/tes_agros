import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tes_agros/screens/chart_store/chart_store.dart';
import 'package:tes_agros/screens/detail_products/detail_products.dart';
import 'package:tes_agros/screens/front_page/wraping_front_page.dart';
import 'package:tes_agros/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      title: 'tes_agros',
      theme: ThemeData(
        fontFamily: "PM",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WrapingFrontPage.namePage,
      getPages: [
        GetPage(
            name: WrapingFrontPage.namePage,
            page: () => const WrapingFrontPage()),
        GetPage(
          name: Home.namePage,
          page: () => const Home(),
        ),
        GetPage(
          name: DetailProducts.namePage,
          page: () => const DetailProducts(),
        ),
        GetPage(
          name: CartStore.namePage,
          page: () => const CartStore(),
        ),
      ],
    );
  }
}
