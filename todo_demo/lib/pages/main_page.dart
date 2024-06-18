import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //string
  String _mystring = "";

  //text catcher
  TextEditingController myController = TextEditingController();
  
  //method
  void _getText(){
    setState(() {
      _mystring="Hello, "+myController.text;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_mystring),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(onPressed: _getText, child:Text("Greet"))
          ],
        )
      ),
    );
  }
}
