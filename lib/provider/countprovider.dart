import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Countprovider with ChangeNotifier{

  int _count = 0 ;
  int get count => _count;

  void setcount(){
    _count++;
    notifyListeners();
  }

}

