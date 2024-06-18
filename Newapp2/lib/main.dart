import 'package:flutter/material.dart';
import 'package:newapp2/pages/counter_page.dart';
import 'package:newapp2/prov/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> CounterProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),

    );

  }
}
