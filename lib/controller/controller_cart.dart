import 'dart:developer';

import 'package:get/get.dart';
import 'package:tes_agros/models/model_cart.dart';

class ControllerCart extends GetxController {
  List<ModelCart> cart = [];

  addCart(ModelCart product) {
    cart.add(product);
    log(cart.length.toString());

    update();
  }

  deleteCart(int index) {
    cart.removeAt(index);
    log(cart.length.toString());
    update();
  }

  updateCart({required int index, int count = 0}) {
    cart[index].count = count;
    update();
  }
}
