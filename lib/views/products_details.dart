// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_super_parameters

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app_store/models/products.dart';

import '../controller/buy_controller.dart';
import '../controller/home_page_controller.dart';
import 'Taps_view.dart';

class ProductsDetails extends StatelessWidget {
  Products product;
  int index;
  ProductsDetails({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);
  HomePageController controller = Get.put(HomePageController());
  Buy controller3 = Get.put(Buy());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => const TapsPage());
          },
          icon: const Icon(
            Icons.keyboard_backspace_sharp,
            color: Colors.white,
          ),
        ),
        title: Text(
          "u".tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: product.products![index].images!.length,
                itemBuilder: (BuildContext context, int e, int pageViewIndex) =>
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "${product.products![index].images![e]}",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        )),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.30,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 8),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${product.products![index].title}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black38),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'description:${product.products![index].description}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "category:${product.products![index].category}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "discountPercentage:${product.products![index].discountPercentage}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "stock:${product.products![index].stock}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    controller.addtocart(controller.products!.products![index],
                        controller.products!.products![index].price!.toInt());
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.deepPurpleAccent,
                  child: Row(
                    children: [
                      Text(
                        "t".tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.shopping_cart_checkout_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: MaterialButton(
              //     onPressed: () {
              //       controller3.addUser();
              //     },
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15)),
              //     color: Colors.deepPurpleAccent,
              //     child: Row(
              //       children: [
              //         Text(
              //           "o".tr,
              //           style: const TextStyle(
              //               color: Colors.white,
              //               fontSize: 15,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         const Spacer(),
              //         const Icon(
              //           Icons.shopify_rounded,
              //           color: Colors.white,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    Get.off(() => const TapsPage());
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.deepPurpleAccent,
                  child: Row(
                    children: [
                      Text(
                        "h".tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
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
