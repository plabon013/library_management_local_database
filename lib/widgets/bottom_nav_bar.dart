// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:library_manager/pages/delayed_books.dart'; 
import 'package:library_manager/pages/home_page.dart';
import 'package:library_manager/pages/library_members.dart';
import 'package:library_manager/pages/reader_page.dart'; 

class BottomNavBar extends StatefulWidget {
  static const routeName = 'bottom-nav-bar';
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
    int _selectedIndex = 0;
  List _widgetOptions = [
   const HomePage(),
   const ReaderPage(),
   
   const DelayedBooksPage(),
   const LibraryMembers(),
    
  ];
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     
      //drawer: AppDrawer(),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/home.png"),
              ),
              label: 'Home',
            ),
           
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/reader.png",),
              ),
              label: 'Reader',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/delay.png",),
              ),
              label: 'Delayed',
            ),
             BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/member.png",),
              ),
              label: 'Members',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          unselectedItemColor: Color.fromARGB(255, 104, 103, 103),
          selectedItemColor: Colors.purple,
           iconSize: 22,

          onTap: _onItemTapped,
          
          elevation: 10),
    );
  }
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}