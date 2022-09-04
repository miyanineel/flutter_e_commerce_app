import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/app_color/app_color.dart';
import 'package:flutter_e_commerce_app/lists/app_list.dart';
import 'package:get/get.dart';

import '../product_page/product_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartList = cartProductsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBgColor,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Cart Products :)",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: cartProductsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 20 / 25,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    cartList[index].image,
                    width: 100,
                  ),
                  Text(
                    cartList[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${cartList[index].prize}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        cartList.remove(cartList[index]);
                      });
                    },
                    icon: const Icon(Icons.delete),
                    color: AppColor.blueAccent,
                    iconSize: 30,
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ProductPage();
            Get.back();
          });
          // Get.back();
        },
        child: const Center(
          child: Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
    );
  }
}
