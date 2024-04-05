// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import 'Product_item.dart';
import 'product_search.dart';
import 'products_details.dart';

class HomePageViewbody extends StatelessWidget {
  HomePageViewbody({super.key});

  HomePageController controller = Get.put(HomePageController());
  HomePageController controller2 = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "a".tr,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurpleAccent,
        leading: Container(
          child: Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_checkout_rounded,
                    size: 35,
                  )),
              GetBuilder<HomePageController>(builder: (controller2) {
                return Positioned(
                    right: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text("${controller2.cartcount}"),
                    ));
              })
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ProductSearch(
                        products: controller2.products!.products!));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          GetBuilder<HomePageController>(
            builder: (controller) => controller.products != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: CarouselSlider.builder(
                      itemCount: controller.products!.products!.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "${controller.products!.products![itemIndex].thumbnail}",
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
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          Expanded(
            child: GetBuilder<HomePageController>(
              builder: (controller) => controller.products != null
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.5,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                      itemCount: controller.products!.products!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => ProductsDetails(
                                    product: controller.products!,
                                    index: index,
                                  ));
                            },
                            child: ProductItem(
                              image:
                                  '${controller.products!.products![index].thumbnail}',
                              price:
                                  '${controller.products!.products![index].price}',
                              title:
                                  '${controller.products!.products![index].title}',
                              description:
                                  '${controller.products!.products![index].brand}',
                              rating:
                                  '${controller.products!.products![index].rating}',
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          )
        ],
      ),
    );
  }
}
