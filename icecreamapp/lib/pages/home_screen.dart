import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icecreamapp/components/icecream_tile.dart';
import 'package:icecreamapp/provs/ice_cream.dart';
import 'package:icecreamapp/provs/shop.dart';
import 'package:provider/provider.dart';
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("Welcome to our shop",
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.brown),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 400,
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text("Search",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("Beat the heat with todays specials......",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.brown),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
                child: ListView.builder(
                  itemCount: context.watch<iceShop>().iceCreamshop.length,
                    itemBuilder: (context, index){
                    IceCream eachicecream = context.watch<iceShop>().iceCreamshop[index];
                    return IceCreamTile(iceCream: eachicecream, icon: Icon(Icons.add),
                      onPressed: (){context.read<iceShop>().additem(eachicecream);},);
                    }))
          ],
        ),

        ),
      );
  }
}
