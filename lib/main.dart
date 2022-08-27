import 'package:flutter/material.dart';
import 'product_list.dart';
import 'cart_page.dart';
import './widgets/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Productlist(),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          MyRoutes.homeRoute: (context) => const Productlist(),
          MyRoutes.cartRoute: (context) => const CartPage(),
        });
  }
}
