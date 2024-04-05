// ignore_for_file: must_be_immutable, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  ProductItem(
      {super.key,
      required this.image,
      required this.price,
      required this.title,
      required this.description,
      required this.rating});
  String? image;
  String? price;
  String? title;
  String? description;
  String? rating;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    Color _iconColor = Colors.white;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            child: Image.network(
              "${widget.image}",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "${widget.title}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "${widget.description}",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text(
                  "price${widget.price}" r"$",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  "(${widget.rating})",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
