import 'package:flutter/material.dart';
import 'package:news_app/view/Main_page.dart';
import 'package:provider/provider.dart';

import 'controller/bottom_nav_controller.dart';
import 'controller/category_controller.dart';
import 'controller/home_screen_controller.dart';
import 'controller/search_screen_controller.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => HomeScreenController(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchScreenController(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomNavScreenController(),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryScreenController(),
      ),
    ]
    ,child: MaterialApp(home: MainPage(),),);
  }
}
