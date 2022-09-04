import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/app_color/app_color.dart';
import 'package:flutter_e_commerce_app/lists/app_list.dart';
import 'package:flutter_e_commerce_app/method/product_cart_method.dart';
import 'package:flutter_e_commerce_app/method/product_like_method.dart';
import 'package:flutter_e_commerce_app/page/cart_page/cart_page.dart';
import 'package:flutter_e_commerce_app/page/like_page/like_page.dart';
import 'package:flutter_e_commerce_app/page/product_information_page/product_information_page.dart';
import 'package:flutter_e_commerce_app/page/product_page/product_page_controller.dart';
import 'package:flutter_e_commerce_app/utils/product_page_text_style/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductPageController productPageController =
      Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBgColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          productPageController.exploreProduct,
          style: exploreProductTextStyle(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Text(
                            productPageController.appleProduct,
                            style: appleProductTextStyle(),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                height: height * 0.6,
                width: width * 1,
                color: AppColor.transparent,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productPageController.AllProductsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 20 / 30,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: const Color(0xffdfe5f9),
                                  child: LikeProducts(
                                    index: index,
                                    products: productPageController
                                        .AllProductsList[index],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: AppColor.appBgColor,
                                  child: CartProducts(
                                    index: index,
                                    products: productPageController
                                        .AllProductsList[index],
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              allProductsList[index].image,
                              width: 100,
                              // height: 50,
                            ),
                            // Image.asset("assets/1.png"),
                            // Container(
                            //   height: 20,
                            //   width: 20,
                            //   color: Colors.greenAccent,
                            //   child: Image.asset(allProductsList[index].image),
                            // ),
                            Text(
                              allProductsList[index].name,
                              style: productNamePriceTextStyle(20),
                            ),
                            Text(
                              "\$${allProductsList[index].prize}",
                              style: productNamePriceTextStyle(20),
                            ),
                            RatingBar.builder(
                              itemSize: 25,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => ProductInformationPage(
                                      index: index,
                                      products: productPageController
                                          .AllProductsList[index],
                                    ));
                              },
                              child: Text(
                                productPageController.seeMoreDetails,
                                style: moreDetailTextStyle(),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: height * 0.1,
                width: width,
                decoration: BoxDecoration(
                  color: AppColor.appBgColorBold,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => const LikePage());
                        },
                        icon: const Icon(Icons.favorite_border),
                        color: AppColor.appBgColor,
                        iconSize: 45,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: const Icon(Icons.add_road_outlined),
                        color: AppColor.appBgColor,
                        iconSize: 45,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => const CartPage());
                        },
                        icon: const Icon(Icons.shopping_bag_outlined),
                        color: AppColor.appBgColor,
                        iconSize: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
