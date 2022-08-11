// ignore_for_file: prefer_const_constructors

import 'dart:io'; 
import 'package:flutter/material.dart'; 
import 'package:library_manager/pages/update_books.dart';
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/book_item.dart';
import 'package:provider/provider.dart'; 

class BookDetails extends StatefulWidget {
  static const routeName = "book-details";
  const BookDetails({Key? key}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  List<dynamic>? items;
  
    

  @override
  void didChangeDependencies() { 
    items = ModalRoute.of(context)!.settings.arguments as List;
    
    super.didChangeDependencies();
  } 

  @override
  Widget build(BuildContext context) {
    
    Provider.of<LibraryProvider>(context, listen: false).getSameBook(items![0].bookName);
    
    
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Book details"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateBookPage(book: items![0])));
          }, icon: Icon(Icons.edit))
        ],
      ),
      body: ListView(
        children: [
         
          SizedBox(
            height: 15,
          ),
          Text(
            items![0].bookName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1,
                wordSpacing: 1),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            items![0].authorName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${items![0].bookCategory}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
                width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.file(
                File(items![0].bookImage),
                height: 200,
                width: 140,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
          ),
          Consumer<LibraryProvider>(
            builder: (context, provider, _) => 
            Text(
              provider.sameReaderBooks.length >= items![0].bookQuantity ?"Not Availeable": "Availeable Now",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 1),
            ),
          ),
          Divider(
            thickness: 1,
          ),

           Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: "Description: " ,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,),
                        children: [
                          TextSpan(
                            text:
                                 items![0].bookDescription,

                            style: TextStyle(
                            
                                color: Colors.black,
                                fontWeight: FontWeight.normal,),
                          )
                        ]),
                  ),
                ),
                 Divider(
            thickness: 1,
          ),
           Text(
            "See more books",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey,letterSpacing: 1, wordSpacing: 1),
          ),
 
  
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true, 
                    
                    itemCount: items![1].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 4,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) =>  BookItem(bookItem: items![1][index], bookList: items![1],  )
                    
                
                    ),
      ),






        ],
      ),
    );
  }
}
