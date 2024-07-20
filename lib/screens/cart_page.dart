import 'package:e_commerce_exam_application/extensions.dart';
import 'package:e_commerce_exam_application/utils/product_data.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;
  double gst = 0;

  void getTotalPrice() {
    cartProducts.forEach((elem) {
      totalPrice += (elem['price'] * elem['qty']);
    });
  }

  @override
  void initState() {
    getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Cart Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.black,
              size: 25,
            ),
          ),
          10.w,
        ],
      ),
      body: (cartProducts.isEmpty)
          ? Center(
              child: Image.network(
                'https://img.freepik.com/premium-vector/shopping-cart-with-cross-mark-wireless-paymant-icon-shopping-bag-failure-paymant-sign-online-shopping-vector_662353-912.jpg',
                width: size.width * 0.8,
                height: size.height * 0.8,
                fit: BoxFit.contain,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: cartProducts.map((elem) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.fromLTRB(16, 7, 16, 0),
                              alignment: Alignment.topCenter,
                              width: size.width,
                              height: size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 28,
                                    spreadRadius: 0,
                                    offset: Offset(0, 14),
                                  ),
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.22),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: size.width * 0.25,
                                    height: size.height * 0.13,
                                    child: Image.network(
                                      elem['thumbnail'],
                                      fit: BoxFit.cover,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(14, 30, 37, 0.12),
                                          blurRadius: 4,
                                          spreadRadius: -5,
                                          offset: Offset(0, 2),
                                        ),
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(14, 30, 37, 0.32),
                                          blurRadius: 16,
                                          spreadRadius: -5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 5, 5, 5),
                                      height: size.height * 0.75,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            elem['title'],
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          5.h,
                                          Row(
                                            children: [
                                              const Text(
                                                'Price : ',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "\$${elem['price']}",
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          5.h,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    elem['qty']--;
                                                    if (elem['qty'] == 0)
                                                      cartProducts.remove(elem);
                                                    else
                                                      getTotalPrice();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .remove_circle_outline_rounded,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              Text(
                                                elem['qty'].toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    elem['qty']++;
                                                    getTotalPrice();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    cartProducts.remove(elem);
                                                    getTotalPrice();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.delete_forever_sharp,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            15.h,
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.3,
                  margin: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(14, 30, 37, 0.12),
                        blurRadius: 4,
                        spreadRadius: -5,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(14, 30, 37, 0.32),
                        blurRadius: 16,
                        spreadRadius: -5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Price\t\t\t: \$ ${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Bill Amount: \$ ${(totalPrice + gst).toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Proceed To Check OUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
