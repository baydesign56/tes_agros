import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tes_agros/models/model_list_products.dart';

class ControllerProducts extends GetxController {
  bool load = false;
  String url1 = "https://rickandmortyapi.com/api/character";
  String nextUrl = "";
  String? errorMessage;
  ModelListProducts? modelListProducts;
  List<Result> listProducts = [];
  List<Result> listProductsQuery = [];
  List<String> category = [];

  query({bool isSearch = true, String? param}) {
    if (isSearch) {
      param = param!.toLowerCase();
      listProductsQuery = listProducts
          .where((element) =>
              element.name!.toLowerCase().contains(param!) ||
              element.species!.toLowerCase().contains(param) ||
              element.gender!.toLowerCase().contains(param) ||
              element.status!.toLowerCase().contains(param))
          .toList();
      update();
    } else {
      param == null
          ? listProductsQuery.addAll(listProducts)
          : listProductsQuery = listProducts
              .where((element) =>
                  element.name! == param ||
                  element.species! == param ||
                  element.gender! == param ||
                  element.status == param)
              .toList();
      update();
    }
  }

  getProducts({String? url}) async {
    load = true;
    errorMessage = null;
    update();
    try {
      var response = await Dio(BaseOptions(
        baseUrl: url1,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      )).get(
        url ?? url1,
      );
      if (response.statusCode == 200) {
        modelListProducts =
            modelListProductsFromMap(json.encode(response.data));
        listProducts.addAll(modelListProducts!.results!);
        listProductsQuery.addAll(listProducts);
        listProductsQuery = listProductsQuery.toSet().toList();
        nextUrl = modelListProducts!.info!.next!;
        for (var item in modelListProducts!.results!) {
          category.add(item.species!);
          category.add(item.gender!);
          category.add(item.status!);

          update();
        }
        category = category.toSet().toList();

        load = false;
        errorMessage = null;
        log(response.data.toString());
        update();
      } else {
        log(response.statusCode.toString());
        errorMessage = response.statusCode.toString();
        update();
      }
      update();
    } on DioError catch (e) {
      load = false;
      if (e.type == DioErrorType.other) {
        errorMessage = "Tidak ada internet";
        update();
      } else {
        errorMessage = e.type.toString();
      }

      update();
    }
    update();
  }
}
