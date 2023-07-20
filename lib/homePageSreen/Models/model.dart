import 'dart:ui';
import 'package:flutter/material.dart';

import '../data/style_Home.dart';


class Model extends StatefulWidget {
  final double padding;
  final double spacing;

  const Model({
    Key? key,
    required this.padding,
    required this.spacing,
  }) : super(key: key);

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  late final ScrollController _scrollController;
  late final double _indexFactor;

  static const _imageWidth = 180.0;
  double _imageOffset = 0.0;

  @override
  void initState() {
    final deviceWidth =
        (window.physicalSize.shortestSide / window.devicePixelRatio);
    _indexFactor = (widget.spacing + _imageWidth) / deviceWidth;
    _imageOffset = -widget.padding / deviceWidth;

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _imageOffset =
            ((_scrollController.offset - widget.padding) / deviceWidth);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
 Widget build(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         SizedBox(width: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.only(top: 60),
            color: Colors.white,
            width: 120,
            height: 120,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Онлайн кредит",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSecondaryColor.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.only(top: 60),
            color: Colors.white,
            width: 120,
            height: 120,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Онлайн депозит",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSecondaryColor.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.only(top: 60),
            color: Colors.white,
            width: 120,
            height: 120,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Добавить шаблон",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSecondaryColor.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ),
         SizedBox(width: 15),
      ],
    ),
  );
}

  }

