// ignore_for_file: must_be_immutable

import 'package:app_store/controller/home_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/buy_controller.dart';
import 'Product_item.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  HomePageController controller = Get.find();
  Buy controller3 = Get.put(Buy());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        title: Text(
          "c".tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GetBuilder<HomePageController>(
        builder: (controller) {
          return controller.cartproduct.isEmpty
              ? const Center(child: Text("no data"))
              : Column(
                  children: [
                    Text(
                      "total:${controller.total}" r"$",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                         controller3.addUser();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.deepPurpleAccent,
                        child: Row(
                          children: [
                            Text(
                              "o".tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.shopify_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.cartproduct.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ProductItem(
                                image:
                                    '${controller.cartproduct[index].thumbnail}',
                                price: '${controller.cartproduct[index].price}',
                                title: '${controller.cartproduct[index].title}',
                                description:
                                    '${controller.cartproduct[index].brand}',
                                rating:
                                    '${controller.cartproduct[index].rating}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                onPressed: () {
                                  controller.removefromecart(
                                      controller.cartproduct[index],
                                      controller.cartproduct[index].price!
                                          .toInt());
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.deepPurpleAccent,
                                child: Row(
                                  children: [
                                    Text(
                                      "r".tr,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.output_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
