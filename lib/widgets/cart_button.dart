import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:megamall/cart_page.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        minWidth: 0,
        height: 0,
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
        child: Badge(
          badgeColor: Colors.red,
          animationDuration: const Duration(microseconds: 300),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
