import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/lists/app_list.dart';
import 'package:flutter_e_commerce_app/model/products_model.dart';

import '../app_color/app_color.dart';

class CartProducts extends StatefulWidget {
  final int index;
  final Products products;
  const CartProducts({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState(this.products);
}

class _CartProductsState extends State<CartProducts> {
  _CartProductsState(this.products);
  final cartList = cartProductsList;
  final Products products;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (cartList.contains(products)) {
            cartList.remove(products);
          } else {
            cartList.add(products);
          }
        });
        log(cartList.toString());
      },
      child: Container(
        height: height * 0.07,
        width: width * 0.35,
        decoration: BoxDecoration(
          color: AppColor.blueAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: cartList.contains(products)
            ? const Center(
                child: Icon(
                  Icons.check,
                  color: AppColor.white,
                ),
              )
            : const Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColor.white,
                ),
              ),
      ),
    );
  }
}
