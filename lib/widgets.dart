import 'package:e_commerce_exam_application/extensions.dart';
import 'package:e_commerce_exam_application/utils/product_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget home_ui(
    {required BuildContext context,
    required List<Map> products,
    String selectedCategory = 'All Products'}) {
  Size size = MediaQuery.sizeOf(context);
  return Expanded(
    child: GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 0,
        childAspectRatio: 0.64,
      ),
      itemBuilder: (BuildContext context, int index) {
        final element = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('detail_Page', arguments: element);
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  blurRadius: 32,
                  offset: Offset(0, 16),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  blurRadius: 64,
                  offset: Offset(0, 32),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.35),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                          element['thumbnail'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  10.h,
                  Text(
                    element['title'],
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.h,
                  RatingBar.builder(
                    initialRating: element['rating'].toDouble(),
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
                  9.h,
                  Row(
                    children: [
                      const Text('Price : '),
                      Text(
                        element['price'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  9.h,
                  SizedBox(
                    width: size.width * 0.40,
                    child: TextButton(
                        onPressed: () {
                          if (!cartProducts.contains(element)) {
                            element['qty'] = 1;
                            cartProducts.add(element);
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
