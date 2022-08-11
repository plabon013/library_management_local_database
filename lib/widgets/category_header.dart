import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_manager/pages/view_all_books.dart';

import '../models/book_model.dart';


class CategoryHeader extends StatelessWidget {
  final String title;
  final List<BookModel> bookList;
  const CategoryHeader({Key? key, required this.title, required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.black),),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, ViewAllBooks.routeName, arguments: [bookList, title]);
        }, child: Text("View All>>", style: TextStyle(color: Colors.grey),))
      ],
    );
  }
}
