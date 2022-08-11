import 'package:flutter/material.dart'; 
import 'package:library_manager/pages/today_return_books.dart'; 
 CustomAppbar(String title, BuildContext context ) {
    return AppBar(
     // centerTitle: true,
     
        title: Text(title.toString()),

        actions: [
         
        if((title !="Today Return Books") )
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, TodayReturnBooks.routeName);
                },
                icon: ImageIcon(AssetImage('assets/images/return.png',)) ),
        ],
        
 
      ); 
  }
