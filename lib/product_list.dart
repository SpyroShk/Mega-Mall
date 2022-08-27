import 'package:flutter/material.dart';
import 'package:megamall/banner.dart';
import 'package:megamall/product_detail.dart';
import 'widgets/cart_button.dart';

List<Products> goods = [
  Products(
      productImage: 'images/wire.png',
      productName: 'TMA-2 HD Wireless',
      price: 'Rp. 1.500.000',
      star: '4.6',
      review: '86 Reviews',
      stocks: 'Tersedia:250',
      desc:
          ' #NOTE \nI did not include the "Add in cart" funtionality as it contains creating a database and other backend knowledge which I lack at the moment and as an intern for my career as a Mobile Application Developer, I would very much like to learn these skills from FeatherWebs Company. \n \nIn terms of the UI or frontend I do have quite acceptable knowledge in Flutter, so I hope I get accepted for this intern, as I would give my all to learn new skills and put those skills to use in the future for this company and my career.'),
  Products(
      productImage: 'images/head.png',
      productName: 'TMA-2 HD Wireless',
      price: 'Rp. 1.500.000',
      star: '4.6',
      review: '86 Reviews',
      stocks: 'Tersedia:250',
      desc:
          'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. \n \nThe speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. '),
];

class Products {
  String productImage;
  String productName;
  String price;
  String star;
  String review;
  String? stocks;
  String? desc;

  Products({
    required this.productImage,
    required this.productName,
    required this.price,
    required this.star,
    required this.review,
    this.stocks,
    this.desc,
  });
}

class Productlist extends StatefulWidget {
  const Productlist({Key? key}) : super(key: key);

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Mega Mall',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [CartButton(), SizedBox(width: 20)],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: 1000,
            child: Column(
              children: [
                const BannerPage(),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: SizedBox(
                        height: 350,
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
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetails(product)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image(
                                              height: 130,
                                              width: 110,
                                              image: AssetImage(product
                                                  .productImage
                                                  .toString()),
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
                                                  product.productName
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: Color(0xFFFFC120),
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
                                                            child: Text(
                                                                'Add to Cart')),
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
              ],
            )),
      ),
    );
  }
}
