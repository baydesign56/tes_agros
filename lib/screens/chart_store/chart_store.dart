import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/controller/controller_cart.dart';

import 'components/card_list_cart.dart';

class CartStore extends StatefulWidget {
  const CartStore({Key? key}) : super(key: key);
  static String namePage = "/cartStore";

  @override
  _CartStoreState createState() => _CartStoreState();
}

class _CartStoreState extends State<CartStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(child: GetBuilder<ControllerCart>(
        builder: (value) {
          return Column(
            children: [
              if (value.cart.isEmpty)
                const Center(
                  child: Text("Keranjang kosong"),
                )
              else
                for (var i = 0; i < value.cart.length; i++)
                  CardListCart(
                    cart: value.cart[i],
                    index: i,
                  )
            ],
          );
        },
      )),
    );
  }
}
