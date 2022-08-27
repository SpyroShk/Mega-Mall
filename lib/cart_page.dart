import 'package:flutter/material.dart';
import './widgets/cart_button.dart';
import 'product_list.dart';
import 'product_detail.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Products> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: const Text(
          'Cart',
          // ignore: unnecessary_const
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [CartButton(), SizedBox(width: 20)],
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: goods.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Products product = goods[index];
                      return Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            MaterialButton(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetails(product)));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image(
                                      height: 130,
                                      width: 110,
                                      image: AssetImage(
                                          product.productImage.toString()),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.productName.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              height: 1),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          product.price.toString(),
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              // ignore: unnecessary_const
                                              color: const Color(0xFFFFC120),
                                              size: 14,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              product.star.toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              product.review.toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            PopupMenuButton(
                                                itemBuilder: (context) {
                                              return [
                                                const PopupMenuItem(
                                                    value: 0,
                                                    child: Text('Add to Cart')),
                                              ];
                                            }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
