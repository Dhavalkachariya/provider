import 'package:flutter/foundation.dart';


class FavouriteItem with ChangeNotifier{
  List<int> _select = [];

  List<int> get select => _select;

  void addItem(int value){
    _select.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    _select.remove(value);
    notifyListeners();
  }
}