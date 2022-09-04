import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/app_color/app_color.dart';
import 'package:flutter_e_commerce_app/method/product_cart_method.dart';
import 'package:flutter_e_commerce_app/method/product_like_method.dart';
import 'package:flutter_e_commerce_app/model/products_model.dart';
import 'package:flutter_e_commerce_app/page/product_information_page/product_information_page_controller.dart';
import 'package:get/get.dart';

class ProductInformationPage extends StatefulWidget {
  final Products products;
  final int index;

  const ProductInformationPage({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  @override
  _ProductInformationPageState createState() =>
      _ProductInformationPageState(this.products);
}

class _ProductInformationPageState extends State<ProductInformationPage> {
  ProductInformationPageController productInformationPageController =
      Get.put(ProductInformationPageController());
  final Products products;

  _ProductInformationPageState(this.products);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBgColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: width * 0.25,
                backgroundImage: AssetImage(products.image),
                backgroundColor: AppColor.white,
              ),
              Container(
                height: height * 0.6,
                width: width * 1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: AppColor.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            products.name,
                            style: const TextStyle(
                              color: AppColor.blueAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          LikeProducts(
                            products: products,
                            index: widget.index,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            productInformationPageController.description,
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColor.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            products.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColor.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CartProducts(
                            products: products,
                            index: widget.index,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
