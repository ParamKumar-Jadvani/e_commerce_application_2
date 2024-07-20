import 'package:e_commerce_exam_application/extensions.dart';
import 'package:flutter/material.dart';

import '../utils/product_data.dart';
import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All Products';
  List<Map<String, dynamic>> get filterProducts => (selectedCategory ==
          'All Products')
      ? allProducts
      : allProducts.where((e) => e['category'] == selectedCategory).toList();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('cart_Page');
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black,
              size: 25,
            ),
          ),
          10.w,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: DropdownButton(
                  value: selectedCategory,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 20,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value.toString();
                    });
                  },
                  items: [
                    const DropdownMenuItem(
                      value: 'All Products',
                      child: Text('All Products'),
                    ),
                    ...categories.map((elem) {
                      return DropdownMenuItem(
                        value: elem,
                        child: Text(elem.tCase),
                      );
                    }),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = 'All Products';
                  });
                },
                child: Visibility(
                  child: Row(
                    children: [
                      Icon(Icons.clear),
                      Text(
                        'Clear',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  visible: (selectedCategory != 'All Products') ? true : false,
                ),
              )
            ],
          ),
          10.h,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              selectedCategory,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          10.h,
          home_ui(
              context: context,
              products: filterProducts,
              selectedCategory: selectedCategory),
        ],
      ),
    );
  }
}
