import 'package:flutter/material.dart';
import 'package:news_app/view/category_screen.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/search_screen.dart';

class BottomNavScreenController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [HomeScreen(), SearchScreen(), CategoryScreen()];
}
