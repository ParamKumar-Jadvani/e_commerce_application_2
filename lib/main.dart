import 'package:e_commerce_exam_application/screens/cart_page.dart';
import 'package:e_commerce_exam_application/screens/detail_page.dart';
import 'package:e_commerce_exam_application/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail_Page': (context) => const DetailPage(),
        'cart_Page': (context) => const CartPage(),
      },
    );
  }
}
