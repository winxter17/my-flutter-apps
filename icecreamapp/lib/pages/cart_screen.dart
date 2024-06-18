import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/icecream_tile.dart';
import '../provs/ice_cream.dart';
import '../provs/shop.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text("Your Cart",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.brown),
                  ),
                ),
                Icon(Icons.shopping_cart,
                  color: Colors.brown,
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: context.watch<iceShop>().userCart.length,
                    itemBuilder: (context, index){
                      IceCream eachicecream = context.watch<iceShop>().userCart[index];
                      return IceCreamTile(iceCream: eachicecream, icon: Icon(Icons.delete),
                        onPressed: (){context.read<iceShop>().removeitem(eachicecream);},);
                    })),
            Container(
              padding: EdgeInsets.all(20),
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your total: " + context.read<iceShop>().cartTotal().toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.receipt_sharp,color: Colors.white,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
