import 'package:flutter/material.dart';
import 'package:icecreamapp/pages/home_page.dart';
import 'package:icecreamapp/provs/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> iceShop())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );


  }
}
