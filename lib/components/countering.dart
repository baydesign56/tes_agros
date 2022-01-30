import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tes_agros/components/constant.dart';

class Countering extends StatefulWidget {
  const Countering({Key? key, required this.onTap, required this.value})
      : super(key: key);
  final ValueChanged<int> onTap;
  final int value;

  @override
  _CounteringState createState() => _CounteringState();
}

class _CounteringState extends State<Countering> {
  decre() {
    setState(() {
      if (widget.value <= 1) {
        log("null");
      } else {
        setState(() {
          int a = widget.value;
          a--;
          widget.onTap(a);
        });
      }
    });
  }

  incre() {
    log("incre");
    log(widget.value.toString(), name: "ini incre");
    int a = widget.value;
    a++;
    setState(() {
      widget.onTap(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: decre,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: const Icon(Icons.remove, color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          height: 30,
          color: primaryInnerColor,
          child: Center(child: Text(widget.value.toString())),
        ),
        GestureDetector(
          onTap: incre,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        )
      ],
    );
  }
}
