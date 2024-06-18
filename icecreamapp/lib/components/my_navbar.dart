import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GNav(
        onTabChange: (value)=> onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.brown,
          iconSize: 30,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
          tabBorderRadius: 25,
          activeColor: Colors.white,
          color: Colors.brown,
          tabs: [
        GButton(icon: Icons.home,
          text: 'Home',
        ),
        GButton(icon: Icons.shopping_cart,
          text: 'Cart',
        )
      ]),
    );
  }
}
