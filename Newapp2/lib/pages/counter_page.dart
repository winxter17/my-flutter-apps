import 'package:flutter/material.dart';
import 'package:newapp2/prov/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  //UI design
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You tapped the number this many times: ",
            style: TextStyle(fontSize: 20),),
            Text(context.watch<CounterProvider>().value.toString(),
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(onPressed: (){context.read<CounterProvider>().incrimentCounter();}, child: Text("Tap")),
            ElevatedButton(onPressed: (){context.read<CounterProvider>().resetCounter();}, child: Text("Reset Button"))
          ],
        ),
      ),
    );
  }
}
