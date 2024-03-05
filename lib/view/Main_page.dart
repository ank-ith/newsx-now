import 'package:flutter/material.dart';
import 'package:news_app/controller/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavScreenController>(context).myPages[
          Provider.of<BottomNavScreenController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff6A3DE8)),
          child: BottomNavigationBar(backgroundColor: Color(0xff6A3DE8),
            currentIndex:
                Provider.of<BottomNavScreenController>(context).selectedIndex,
            onTap:
                Provider.of<BottomNavScreenController>(context, listen: false)
                    .onItemTap,
            elevation: 0,
            selectedIconTheme: IconThemeData(color: Colors.white,size: 25),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category')
            ],

          ),
        ),
      ),
    );
  }
}
