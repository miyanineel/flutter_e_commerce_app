import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/lists/app_list.dart';
import 'package:flutter_e_commerce_app/model/products_model.dart';

import '../app_color/app_color.dart';

class LikeProducts extends StatefulWidget {
  final int index;
  final Products products;
  const LikeProducts({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  @override
  _LikeProductsState createState() => _LikeProductsState(this.products);
}

class _LikeProductsState extends State<LikeProducts> {
  _LikeProductsState(this.products);
  final likeList = likeProductsList;
  final Products products;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.11,
      width: width * 0.11,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: likeList.contains(products)
            ? AppColor.pink20
            : AppColor.blueAccent50,
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            if (likeList.contains(products)) {
              likeList.remove(products);
            } else {
              likeList.add(products);
            }
          });
          log(likeList.toString());
        },
        icon: likeList.contains(products)
            ? const Icon(Icons.favorite, color: AppColor.pink50)
            : const Icon(Icons.favorite_border, color: AppColor.blueAccent),
      ),
    );
  }
}
