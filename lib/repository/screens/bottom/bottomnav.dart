import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewsapp/repository/screens/favourite/favouritescreen.dart';
import 'package:mynewsapp/repository/screens/home/homescreen.dart';
import 'package:mynewsapp/repository/screens/profile/profilescreen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
     HomeScreen(),
    const FavouriteScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0XFF1F41BB),
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: "Favourite"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.smiley), label: "Profile")
          ]),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
