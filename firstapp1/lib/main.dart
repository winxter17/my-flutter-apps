import 'package:firstapp1/pages/first_page.dart';
import 'package:firstapp1/pages/home_page.dart';
import 'package:firstapp1/pages/profile_page.dart';
import 'package:firstapp1/pages/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home(),);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FirstPage(),
      routes: {
        '/homepage': (context)=> HomePage(),
        '/settings': (context)=> Settings(),
        '/profile': (context)=> ProfilePage(),
      },
    );
  }
}
