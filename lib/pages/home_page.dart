// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:library_manager/pages/view_all_books.dart';
import 'package:library_manager/pages/view_all_category.dart';
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/app_drawer.dart';
import 'package:library_manager/widgets/book_item.dart';
import 'package:library_manager/widgets/category_header.dart'; 
import 'package:library_manager/widgets/home_category_books.dart';
import 'package:library_manager/widgets/slider.dart';
import 'package:provider/provider.dart';

import 'custom_search_book_item_page.dart';
import 'today_return_books.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }
    var category_items = [

    'CSE',
    'EEE',
    'CIVIL',
    'TEXTILE',
    'MECHANICAL',
    'STORY',
    'HISTORY',
    'POEM',
    'ISLAMIC',
    'MOTIVATIONAL',
    'HORROR',
    'OTHERS',
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<LibraryProvider>(context, listen: false).getAllCSEBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllEEEBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllCIVILBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllTEXTILEBooks();
    Provider.of<LibraryProvider>(context, listen: false)
        .getAllMECHANICALBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllSTORYBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllHISTORYBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllPOEMBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllISLAMICBooks();
    Provider.of<LibraryProvider>(context, listen: false)
        .getAllMOTIVATIONALBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllHORRORBooks();
    Provider.of<LibraryProvider>(context, listen: false).getAllOTHERSBooks();
    return Scaffold(
        appBar: AppBar(
          title: Text("Library Managment"),
          actions: [
            Consumer<LibraryProvider>(
              builder: (context, provider, _) => IconButton(
                  onPressed: () {
                    final bookList = provider.booksList;
                    showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(bookList));
                  },
                  icon: const Icon(Icons.search)),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, TodayReturnBooks.routeName);
                },
                icon: ImageIcon(AssetImage('assets/images/return.png',)) ),
          ],
        ),
        drawer: AppDrawer(),
        body: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              TopSlider(),
              Text(
                "Explore your books",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                    letterSpacing: 1,
                    wordSpacing: 1),
              ),

              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                    Text("Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.black),),
      
                   TextButton(onPressed: (){
          Navigator.pushNamed(context, ViewAllCategory.routeName);
        }, child: Text("View All>>", style: TextStyle(color: Colors.grey),))
                ],
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => Container(
      padding: EdgeInsets.all(7),
      
      height: 75,
      width: 78,
      child: Consumer<LibraryProvider>(
        builder: (context, provider, _) => 
          InkWell(
          onTap: (){

          Navigator.pushNamed(context, ViewAllBooks.routeName, arguments: [provider.listOfCategoryListBooks[index],category_items[index]]);
            
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
        
            child: FittedBox(child: Text(category_items[index],textAlign: TextAlign.center, style: TextStyle(fontSize: 12),)),
            
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(60),
               color: Color(0xfff2f2f2)
        
            ),
        
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.withOpacity(0.5),width: 1),
        borderRadius: BorderRadius.circular(60)
      ),
    )),
    SizedBox(height: 15,),
              Divider(),
              Container(
                height: 490,
                child: Consumer<LibraryProvider>(
                  builder: (context, provider, _) => Column(
                    children: [
                      CategoryHeader(
                        title: "All category Books",
                        bookList: provider.booksList,
                      ),
                      Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: provider.booksList.length > 6
                                ? 6
                                : provider.booksList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 10 / 19,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) => BookItem(
                                  bookItem: provider.booksList[index],
                                  bookList: provider.booksList,
                                )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
          
         
            ],
          ),
        ));
  }
}
