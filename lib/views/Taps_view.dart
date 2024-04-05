// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Home_page_view_body.dart';
import 'cart_view.dart';
import 'favorit_view.dart';
import 'profil_view.dart';

class TapsPage extends StatefulWidget {
  const TapsPage({super.key});

  @override
  State<TapsPage> createState() => _TapsPageState();
}

class _TapsPageState extends State<TapsPage> {
  int index = 0;

  void _selectscreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Map<String, dynamic>> _screens = [
    {
      'Screen': HomePageViewbody(),
      // 'Title':"الصفحة الرئيسية"
    },
    {
      "Screen": const FavoritesView(),
    },
    {
      "Screen": CartView(),
    },
    {
      "Screen": const ProfilView(),
    },
  ];

  final items = <Widget>[
    const Icon(
      Icons.home,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.shop_2_outlined,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.shopping_cart_outlined,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.person,
      size: 30,
      color: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex]["Screen"],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepPurpleAccent,
        backgroundColor: Colors.transparent,
        height: 50,
        index: index,
        items: items,
        onTap: _selectscreen,
      ),
    );
  }
}
