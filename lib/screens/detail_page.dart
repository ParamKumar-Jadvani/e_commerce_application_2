import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_exam_application/extensions.dart';
import 'package:e_commerce_exam_application/utils/product_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> Product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title:
            const Text('Product Detail', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: size.height * 0.4,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
            items: (Product['images'] as List<dynamic>).map<Widget>((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          16.h,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade100,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(9, 30, 66, 0.25),
                  blurRadius: 8,
                  spreadRadius: -2,
                  offset: Offset(0, -3),
                ),
                BoxShadow(
                  color: Color.fromRGBO(9, 30, 66, 0.08),
                  blurRadius: 0,
                  spreadRadius: 1,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Product['title'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.h,
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: Product['rating'].toDouble(),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      14.w,
                      Text(
                        Product['rating'].toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  10.h,
                  Row(
                    children: [
                      const Text(
                        'Price : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '\$ ${Product['price'].toString()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  18.h,
                  Text(
                    Product['description'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                  18.h,
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (!cartProducts.contains(Product)) {
                          Product['qty'] = 1;
                          cartProducts.add(Product);
                        }
                        Navigator.of(context).pushNamed('cart_Page');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
