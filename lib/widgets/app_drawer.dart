// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_manager/auth_pref.dart';
import 'package:library_manager/models/admin_db_model.dart';
import 'package:library_manager/pages/about_library_page.dart';
import 'package:library_manager/pages/dashbord_page.dart'; 
import 'package:library_manager/pages/login_page.dart';
import 'package:library_manager/pages/today_return_books.dart'; 
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; 

class AppDrawer extends StatelessWidget {
    AppDrawer({Key? key}) : super(key: key);

  AdminDatabaseModel? adminModel;

  @override
  Widget build(BuildContext context) {
    Provider.of<LibraryProvider>(context,listen: false).getAllAdmin();
    return Drawer(
      child: Consumer<LibraryProvider>(
          builder: (context, provider, _) =>  Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
        

          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FutureBuilder(
                      future: getData(context),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                         return adminModel!.adminImage ==null? Image.asset(
                        "assets/images/man.png",
                        fit: BoxFit.cover,
                      ): Image.file(File(adminModel!.adminImage.toString()));
                        }
                         return  CircularProgressIndicator();
                      },
                    
                    ),
                  ),
            accountName: FutureBuilder(
              future: getData(context),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(adminModel!.adminName);
                }
                return CircularProgressIndicator();
              }
               ),


            accountEmail:   FutureBuilder(
              future: getData(context),

              builder: (context, snapshot) {
                if(snapshot.hasData){
                 return Text(adminModel!.adminEmail);
                }
                return CircularProgressIndicator();
              },
                ),
           
            
         ),

          ListTile(
            onTap: (){
              Navigator.pushNamed(context, BottomNavBar.routeName);
            },
            leading:  Icon(Icons.home_sharp),
              title: Text("Home"),
          ),
          
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, DashbordPage.routeName);
              },
            leading:  Icon(Icons.dashboard),
              title: Text("Dashboard"),
          ),
  
            ListTile(
            leading:  Icon(Icons.my_library_books
            ),
            onTap: (){
              Navigator.pushNamed(context, AboutLibraryPage.routeName);
            },
              title: Text("About Library"),
          ),
             ListTile(
            leading:  ImageIcon(AssetImage("assets/images/return.png"))
            ,
             onTap: (){
              Navigator.pushNamed(context, TodayReturnBooks.routeName);
            },
              title: Text("Today Return Books"),
          ),
             
         
            ListTile(
            leading:  Icon(Icons.location_on
            ),
            onTap: (){
              _makeCurrentLocation();
            },
              title: Text("Library Location"),
          ),
         
            ListTile(
            leading:  Icon(Icons.settings_outlined
            ),
              title: Text("Setting"),
          ),
          Divider(),


          OutlinedButton(
             style: OutlinedButton.styleFrom(
              primary: Colors.purple,
               side: BorderSide(color: Colors.purple),
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
               )
             ),
            onPressed: (){

              setLogInStatus(false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
              


          }, child: Text("LogOut"))




          
          
        ],
      
      ),)
    );
  }
    void _makeCurrentLocation() async {
    final url = Uri.parse("geo:0,0?q=Deffodil Univercity Library");
    if (url != null) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  } 
  
  
 Future<AdminDatabaseModel> getData(BuildContext context)async{

   return adminModel =await Provider.of<LibraryProvider>(context,listen: false).getAllAdmin();
  }

}