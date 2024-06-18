import 'package:flutter/material.dart';
import 'package:icecreamapp/provs/ice_cream.dart';

class IceCreamTile extends StatelessWidget {
  final IceCream iceCream;
  final Icon icon;
  void Function()? onPressed;
  IceCreamTile({super.key, required this.iceCream, required this.icon, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.brown,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(leading: Image.asset(iceCream.imagePath),
          title: Text(iceCream.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          subtitle: Text("₹"+iceCream.price.toString(),
            style: TextStyle(
                color: Colors.grey[300]
            ),
        ),
          trailing: IconButton(icon: icon, onPressed: onPressed,color: Colors.white,),
            ),
      ));
  }
}
