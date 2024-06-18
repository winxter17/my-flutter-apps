import 'package:flutter/material.dart';
import 'package:icecreamapp/pages/shop_home.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/shop.png')),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("Gorom lagche?.. Ice cream khalo!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> ShopeHome()));
            }, child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Go To Icecream Shop >",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[800],
                shadowColor: Colors.black,
              )
            )
          ],
        ),
      ),
    );
  }
}
