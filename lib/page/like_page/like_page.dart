import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/app_color/app_color.dart';
import 'package:flutter_e_commerce_app/lists/app_list.dart';
import 'package:flutter_e_commerce_app/page/like_page/like_page_controller.dart';
import 'package:flutter_e_commerce_app/page/product_page/product_page.dart';
import 'package:get/get.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  LikePageController likePageController = Get.put(LikePageController());
  final likeList = likeProductsList;
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
          "Like Products :)",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: likeProductsList.length,
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
                    likeList[index].image,
                    width: 100,
                  ),
                  Text(
                    likeList[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${likeList[index].prize}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        likeList.remove(likeList[index]);
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
        onPressed: () async {
          setState(() {
            ProductPage();
          });
          Get.back();
        },
        child: const Center(
          child: Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
    );
  }
}
