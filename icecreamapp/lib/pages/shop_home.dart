import 'package:flutter/material.dart';
import 'package:icecreamapp/components/my_navbar.dart';
import 'package:icecreamapp/pages/cart_screen.dart';
import 'package:icecreamapp/pages/home_screen.dart';
class ShopeHome extends StatefulWidget {
  const ShopeHome({super.key});

  @override
  State<ShopeHome> createState() => _ShopeHomeState();
}

class _ShopeHomeState extends State<ShopeHome> {
  //navigation
  int _selectedIndex=0;
  void navigateScreen(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  //pages list
  List<Widget> screens = [
    ShopScreen(), CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavbar(
        onTabChange:(index)=> navigateScreen(index),
      ),
      body: screens[_selectedIndex],
    );
  }
}
