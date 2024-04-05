// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/products.dart';
class HomePageController extends GetxController{
  @override
  void onInit() {
    super.onInit();
   getproducts(); 
  }
  Products? products;
   getproducts()async{
  http.Response  response = (await http.get(Uri.parse("https://dummyjson.com/products")));
    Map<String,dynamic> data = jsonDecode(response.body);
    products = Products.fromJson(data);
    print(products!.products![1].title);
    
    update();
  }
  int cartcount=0;
  int total =0;
  List<Product> cartproduct =[];

  addtocart(product , int price){
    cartproduct.add(product);
    cartcount++;
    total += price;
    update();
  }
  removefromecart(product,int price){
    cartproduct.remove(product);
    cartcount--;
    total -= price;
    update();
  }
}