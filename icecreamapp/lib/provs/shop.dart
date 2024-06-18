import 'package:flutter/material.dart';
import 'package:icecreamapp/provs/ice_cream.dart';

class iceShop extends ChangeNotifier{

  //icecream for sale list
  final List<IceCream> _shop = [
    //chocoblast
    IceCream(name: "Choco Blast", price: 70, imagePath: 'images/chocoblast.png'),
    //choco butterscotch
    IceCream(name: "Choco Butterscotch", price: 100, imagePath: 'images/chocoscotch.png'),
    //icecream sandwich
    IceCream(name: "Icecream Sandwich", price: 120, imagePath: 'images/sandwich.png'),
    //strawberry blast
    IceCream(name: "Strawberry Blast", price: 90, imagePath: 'images/strawberry.png'),
    //watermelon sugar
    IceCream(name: "Watermelon Sugar", price: 70, imagePath: 'images/watermelon.png')
  ];

  //user cart
  List<IceCream> _cart =[];

  //get sale list
  List<IceCream> get iceCreamshop => _shop;

  //get user cart
  List<IceCream> get userCart => _cart;

  //add to cart method
  void additem(IceCream iceCream){
    _cart.add(iceCream);
    notifyListeners();
  }
  //remove from cart method
  void removeitem(IceCream iceCream){
    _cart.remove(iceCream);
    notifyListeners();
  }
  // total cart amount
int cartTotal(){
    int total =0;
    for(int i=0;i<(userCart.length);i++){
      total += userCart[i].price;
    }
    return total;
    notifyListeners();
}

}