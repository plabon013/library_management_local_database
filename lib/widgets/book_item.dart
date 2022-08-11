// ignore_for_file: prefer_const_constructors

import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:library_manager/pages/book_details.dart';

import '../models/book_model.dart';

class BookItem extends StatelessWidget {
  final BookModel bookItem;
  final List<BookModel> bookList;
 
  const BookItem({Key? key, required this.bookItem, required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, BookDetails.routeName, arguments: [bookItem, bookList]);
                 },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.file(
                    File(bookItem.bookImage), height: 170, width:120, fit: BoxFit.cover,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: FittedBox(
                  child: Text(
                    bookItem.bookName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(bookItem.authorName,
                  style: TextStyle(fontSize: 11, color: Colors.black54))
            ])));
  }
}
