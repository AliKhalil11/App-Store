// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/product.dart';
import 'Product_item.dart';
import 'Search_deatails.dart';

class ProductSearch extends SearchDelegate {
  List<Product> products;
  ProductSearch({required this.products});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> filter = products.where((element) {
      return element.title!.startsWith(query);
    }).toList();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemCount: query == "" ? products.length : filter.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: InkWell(
            onTap: () {
              query == ""
                  ? Get.to(() => SearchDeatils(
                        index: index,
                        product: products,
                      ))
                  : Get.to(() => SearchDeatils(
                        index: index,
                        product: filter,
                      ));
            },
            child: ProductItem(
              image: query == " "
                  ? '${products[index].thumbnail}'
                  : '${filter[index].thumbnail}',
              price: query == ""
                  ? '${products[index].price}'
                  : "${filter[index].price}",
              title: query == ""
                  ? '${products[index].title}'
                  : "${filter[index].title}",
              description: query == ""
                  ? '${products[index].description}'
                  : "${filter[index].description}",
              rating: query == ""
                  ? '${products[index].rating}'
                  : "${filter[index].rating}",
            ),
          ),
        );
      },
    );
  }
}
