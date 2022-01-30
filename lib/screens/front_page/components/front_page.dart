import 'package:flutter/material.dart';
import 'package:tes_agros/components/button_primary.dart';
import 'package:tes_agros/components/constant.dart';
import 'package:tes_agros/components/widget_glassmorph.dart';

class FrontPage extends StatefulWidget {
  const FrontPage(
      {Key? key,
      this.imageAssets = "assets/images/pexels-mark-stebnicki-2255935.jpg",
      this.firstTitle = "Digital",
      this.secondTitle = "Grocery Store",
      this.titleButton = "SHOP NOW",
      this.titleContent = "The most complete and cheap\ngrocery store",
      this.functionToPage})
      : super(key: key);
  final String? imageAssets;
  final String? firstTitle;
  final String? secondTitle;
  final String? titleContent;
  final ValueChanged<bool>? functionToPage;
  final String? titleButton;

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                widget.imageAssets ?? "",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: defauldPadding * 2,
                left: defauldPadding * 2,
                right: defauldPadding * 2,
                child: widgetGlassmorph(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.firstTitle ?? "",
                            style:
                                const TextStyle(fontSize: 24, fontFamily: "PB"),
                          ),
                          Text(
                            widget.secondTitle ?? "",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "PB",
                                color: primaryOrange),
                          ),
                          SizedBox(
                            height: defauldPadding - 5,
                          ),
                          Text(
                            widget.titleContent ?? "",
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: defauldPadding * 2,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.functionToPage!(true);
                            });
                          },
                          child: buttonPrimary(
                            title: Text(
                              widget.titleButton ?? "-",
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "PB",
                                fontSize: 15,
                              ),
                            ),
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
