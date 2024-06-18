
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int value;
  CounterProvider({
    this.value=0,
});
  void incrimentCounter(){
    value++;
    notifyListeners();
  }
  void resetCounter(){
    value=0;
    notifyListeners();
  }
}