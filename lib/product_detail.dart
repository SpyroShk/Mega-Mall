import 'package:flutter/material.dart';
import 'product_list.dart';
import './widgets/cart_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(this.product);
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Productlist()),
            );
          },
        ),
        title: const Text(
          'Detail Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [CartButton(), SizedBox(width: 20)],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                  color: const Color(0xFFFAFAFA),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 50, right: 50, bottom: 30),
                    child: Image.asset(product.productImage),
                  )),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    transform: Matrix4.translationValues(-50.0, 0, 0.0),
                    child: Text(
                      product.productName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(-92.0, 0, 0.0),
                    child: Text(
                      product.price.toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 2),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 0,
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Color(0xFFFFC120),
                              size: 15,
                            ),
                          ),
                          Container(
                            child: Text(
                              product.star.toString(),
                              style: const TextStyle(fontSize: 16, height: 2),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 30,
                            ),
                            child: Text(
                              product.review.toString(),
                              style: const TextStyle(fontSize: 16, height: 2),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 25,
                        width: 110,
                        transform: Matrix4.translationValues(-20.0, 0, 0.0),
                        decoration: const BoxDecoration(
                            color: Color(0xFFEEFAF6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Text(
                            product.stocks.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 20, top: 20),
                      child: const Divider(color: Colors.grey)),
                  Container(
                    transform: Matrix4.translationValues(-75.0, 0, 0.0),
                    child: const Text(
                      'Description Product',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: Text(
                      product.desc.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    transform: Matrix4.translationValues(75.0, 20, 0.0),
                    child: MaterialButton(
                      height: 60,
                      minWidth: 160,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {},
                      color: const Color(0xFF3669C9),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
